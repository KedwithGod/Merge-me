import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:mergeme/Model/Service/Auth_service.dart';
import 'package:mergeme/Model/Service/DateTime_service.dart';
import 'package:mergeme/Model/Service/Navigator_service.dart';
import 'package:mergeme/Model/Service/firestore_service.dart';
import 'package:mergeme/Model/Service/localStorage_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/enums/viewstate.dart';
import 'package:mergeme/ViewModel/BaseModel.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:mergeme/Model/UserModel/userModel.dart';

class JobViewModel extends BaseModel {
  final String collectionName;
  final NavigatorService _navigationService = locator<NavigatorService>();
  final LocalStorageService _storageService = locator<LocalStorageService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final FireStoreService _fireStore = locator<FireStoreService>();
  var idFromStorage;
  var selectedTrade;
  var locationValue;
  var jobPosterName;
  bool _visible=false;
  ScrollController hideLabelController;
  List<PostJobDetails> _jobDetails;

  bool get visible=>_visible;



  JobViewModel(this.collectionName);
  List<PostJobDetails> get jobDetails =>_jobDetails;





  List<PostJobDetails> jobDetail(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return PostJobDetails(
          jobPosterId :doc.data[route.UserID],
          jobType: doc.data[route.JobType],
          location :doc.data[route.JobPosterLocation],
          budget:doc.data[route.JobBudget],
          duration:doc.data[route.JobDuration],
          time:doc.data[route.TimeJobWasPosted],
          date:doc.data[route.DateJobWasPosted],
          jobDescription:doc.data[route.JobDescription]
      );
    }).toList();
  }

  Stream<List<PostJobDetails>> get jobDetailStream  {
    return Firestore.instance.collection(collectionName).snapshots()
        .map(jobDetail);
  }




  getSelected() async{
    await _storageService.getFromDisk(route.SelectedTrade).then((onValue){
      selectedTrade=onValue!=null?onValue:'Select trade';
      notifyListeners();
    });
    await _storageService.getFromDisk(route.Location).then((onValue){
      locationValue=onValue!=null?onValue:'Default location';
      notifyListeners();
    });

  }
// update data from postJob page
  validateForm(GlobalKey<FormState> formKey, jobType, location, duration,
      budget, jobDescription, tradePage, context) async {
    if (formKey.currentState.validate()) {
      var dateCurrently = await currentDate(route.Date);
      var timeCurrently = await currentTime();
      await _storageService.setUser('Date', dateCurrently);
      await _storageService.setUser('Time', timeCurrently);
      await _storageService.getFromDisk(route.UserID).then((onValue) {
        idFromStorage = onValue;
        notifyListeners();
      });
      final jobPosterId = _authenticationService.currentUser != null
          ? _authenticationService.currentUser.id
          : idFromStorage != null ? idFromStorage : null;

      final jobDetails = PostJobDetails(
          jobType: jobType,
          jobDescription: jobDescription,
          location: location,
          budget: budget,
          duration: duration,
          time: timeCurrently,
          date: dateCurrently,
          jobPosterId: jobPosterId);
      await _fireStore.saveData(
          jobDetails.toJson(), "${route.GiveWork + ""+ tradePage}"
          );

      jobDetails.toJson().forEach((key, value) async {
        await _storageService.setUser(key, value);});


        await _navigationService.nextPage(route.MyJobPageRoute);
    }
  }

// get jobPoster database from his uid
  getJobPosterData(document)async{
    try {
      var jobDocumentSnapshot = await Firestore.instance.collection('DataBase')
          .document(document.jobPosterId)
          .get().then((value){
            jobPosterName=value.data[route.Name];
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

  // to wait for page to load

// get data from fireStore to find Job page
   listenToPosts() {

    _fireStore.listenToJobPosterDataRealTime(collectionName).listen((data) {
      List<PostJobDetails> updatedData = data;
      print(data);
      if (updatedData != null && updatedData.length > 0) {
        _jobDetails = updatedData;
        print(_jobDetails);
        notifyListeners();
      }

      setState(ViewState.Idle);
    });


  }

// navigating to JobDescription page
  jobDescriptionNavigation(arguments)async{
    return await _navigationService.navigateTo(route.JobDescriptionPageRoute,arguments: arguments);
  }

  // performing string operation
  stringOperation(int a,  document){
    List mainString=document.jobDescription.split(' ');
    var stringToList = mainString.sublist(
        a > mainString.length || a < 0 ? 0 : a,
         );
    var finalString=stringToList.join(' ');
    return finalString;
  }



 hideControllerFunction(){

   hideLabelController.addListener((){
     if(hideLabelController.position.userScrollDirection == ScrollDirection.reverse){
       if(_visible == false) {
         _visible=true;
         notifyListeners();

       }
     } else {
       if (hideLabelController.position.userScrollDirection ==
           ScrollDirection.forward) {
         if (_visible == true) {
           _visible = false;
           notifyListeners();
         }
       }
     }});}}
