import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:mergeme/Model/Database/FirebaseStorage.dart';

import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/constants/CountDown.dart';
import 'package:mergeme/ViewModel/BaseModel.dart';
import 'package:quiver/async.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;

class JobDescriptionViewModel extends BaseModel{

  int _elapsed=0;
  int init=0;
  var userIdentity;
  var jobPosterName;
  int get elapsed=>_elapsed>=15?_elapsed=0:_elapsed=_elapsed;

  // get field variable forms shared preferences
  final Firebase _firebase = locator<Firebase>();
  final CountDown _countdown=locator<CountDown>();

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




  @override
  void dispose() {

    _countdown..dispose();
    super.dispose();
  }

  setUseIdentity(value){
    userIdentity=value;
    notifyListeners();
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
      length==0?  await _firebase.downloadAnyFile(singleFileFolder,).then((value) { file.add(value);
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


}