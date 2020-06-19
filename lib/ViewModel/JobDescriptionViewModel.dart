import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:mergeme/Model/Database/FirebaseStorage.dart';
import 'package:mergeme/Model/Service/DateTime_service.dart';
import 'package:mergeme/Model/Service/firestore_service.dart';
import 'package:mergeme/Model/Service/localStorage_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/constants/CountDown.dart';
import 'package:mergeme/ViewModel/BaseModel.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:mergeme/ViewModel/postJobViewModel.dart';

class JobDescriptionViewModel extends BaseModel{

  // field instance
  int _elapsed=0;
  int init=0;
  var userIdentity;
  var jobPosterName;
  var bidSenderName;
  String specificTrade;
  int get elapsed=>_elapsed>=15?_elapsed=0:_elapsed=_elapsed;

  // get field variable forms shared preferences
  final Firebase _firebase = locator<Firebase>();
  final CountDown _countdown=locator<CountDown>();
  final LocalStorageService _storageService = locator<LocalStorageService>();
  final FireStoreService _fireStore = locator<FireStoreService>();


  loadingWidget() {
   return _countdown.loadingWidget(_elapsed, 15);
  }

  initLoading(){
    return _countdown.initLoading(init, 3);
  }
  initTimer(){
    _countdown.initLoading(init, 3).listen((data){
      init=data;
      notifyListeners();
    });
    print('$init');
  }

  listenToTimer(){
    _countdown.loadingWidget(_elapsed, 15).listen((data){
      _elapsed=data;
      notifyListeners();
    });
    print('$elapsed');
  }

  static Future<int> getData(){
    return Future.delayed(Duration(seconds:15));
  }

  Stream stream =Stream.fromFuture(getData());

  setTradeName(tradeName){
    _storageService.setUser(route.JobDescriptionTradeName, tradeName);
    notifyListeners();
  }
  setBudgetName(budget){
    _storageService.setUser(route.JobDescriptionBudget,  budget);
    notifyListeners();
  }

  setDescription(description){
    _storageService.setUser(route.JobDescriptionDescription, description);
    notifyListeners();
  }

  setDuration(duration){
    _storageService.setUser(route.JobDescriptionDuration,duration);
    notifyListeners();
  }

  setLocation(location){
    _storageService.setUser(route.JobDescriptionLocation,location);
    notifyListeners();
  }

  @override
  void dispose() {

    _countdown..dispose();
    super.dispose();
  }

  // to set user identity to true if job poster is  the one viewing the post
  setUseIdentity(value){
    userIdentity=value;
    notifyListeners();
  }

  getBidSenderName() async{
    try {
      var jobDocumentSnapshot = await Firestore.instance.collection('DataBase')
          .document(currentUser.id)
          .get().then((value) {
        bidSenderName = value.data[route.Name];
        notifyListeners();
      });
      return jobDocumentSnapshot;
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  getJobPosterData(document) async {
    try {
      var jobDocumentSnapshot = await Firestore.instance.collection('DataBase')
          .document(document.jobPosterId)
          .get().then((value) {
        jobPosterName = value.data[route.Name];
        notifyListeners();
      });
      return jobDocumentSnapshot;
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  stringOperation(int a, document) {
    List mainString = document.jobDescription.split(' ');
    var stringToList = mainString.sublist(
      a > mainString.length || a < 0 ? 0 : a,
    );
    var finalString = stringToList.join(' ');
    return finalString;
  }

  getUploadedDocuments(singleFileFolder,multiFileFolder,length)async {
    try{
      var file=[];
      length == 0
          ? await _firebase
              .downloadAnyFile(
              singleFileFolder,
            )
              .then((value) {
              file.add(value);
            }):

      multiFileFolder.forEach((key,value) async{
        await _firebase.downloadAnyFile(key).then((value) { file.add(value);
        });

      });
      file==null?file=[]: file=file;
      return file;
    }catch(e){
      print(e);
    }

  }

  sendNotification(message,userId, notificationSender) async {
    await _fireStore.notificationFile(
        "${route.BidFireStoreDocument} ",
        message, userId, notificationSender);
  }

  // get specificTrade

  getTrade(value){
    specificTrade=value;
    notifyListeners();
  }

  //set status to active

statusBid(tradePage,document)async{
  var dateCurrently = await currentDate(route.Date);
  var timeCurrently = await currentTime();
  print('job documentId at status Active: ${document.documentId}');
  return await Firestore.instance.collection("${route.GiveWork + "" + tradePage}")
      .document(document['documentId']).setData({
    route.JobStatus:route.Bid,
    route.TimeJobWasPosted:timeCurrently,
    route.DateJobWasPosted:dateCurrently
  },merge: true);
}

}