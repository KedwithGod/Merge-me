import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:mergeme/Model/Database/FirebaseStorage.dart';
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
import 'package:quiver/async.dart';
import 'package:random_string/random_string.dart';

class JobViewModel extends BaseModel  {
  // field instance
  final String collectionName;

  // locator services
  final NavigatorService _navigationService = locator<NavigatorService>();
  final LocalStorageService _storageService = locator<LocalStorageService>();
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  final FireStoreService _fireStore = locator<FireStoreService>();
  final Firebase _firebase = locator<Firebase>();

  // field variable
  var idFromStorage;
  var selectedTrade;
  var locationValue;
  var jobPosterName;
  var noOfFileUploaded;
  var singleFileUploaded;
  var multipleFileUploaded=Map();
  var userIdentity;
  int _elapsed=0;
  bool _visible = false;
  ScrollController hideLabelController;
  List<PostJobDetails> _jobDetails;
  var uploadFile;
  Timer _timer;
  int start = 0;

   startTimer() async {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
            if (start > 9) {
              timer.cancel();
              notifyListeners();
            } else {
              start = start +1;
              notifyListeners();
            }
            return start;
          }

    );
    return _timer;
  }




  bool get visible => _visible;
  int get elapsed=>_elapsed==16?_elapsed=0:_elapsed=_elapsed;

  JobViewModel(this.collectionName);

  List<PostJobDetails> get jobDetails => _jobDetails;



// getting PostJob value
  List<PostJobDetails> jobDetail( snapshot) {
    return snapshot.documents.map((doc) {
      //print(doc.data);
      return PostJobDetails(
          jobPosterId: doc.data[route.UserID],
          jobType: doc.data[route.JobType],
          location: doc.data[route.JobPosterLocation],
          budget: doc.data[route.JobBudget],
          duration: doc.data[route.JobDuration],
          time: doc.data[route.TimeJobWasPosted],
          date: doc.data[route.DateJobWasPosted],
          jobDescription: doc.data[route.JobDescription]
      );
    }).toList();
  }


// jobDetailStream
  Stream<List<PostJobDetails>> get jobDetailStream {
    return Firestore.instance.collection(collectionName).snapshots()
        .map(jobDetail);
  }


// update data from postJob page
  validateForm(GlobalKey<FormState> formKey, jobType, location, duration,
      budget, jobDescription, tradePage, context) async {
    if (formKey.currentState.validate()) {
      var dateCurrently = await currentDate(route.Date);
      var timeCurrently = await currentTime();
      await _storageService.setUser('Date', dateCurrently);
      await _storageService.setUser('Time', timeCurrently);
      idFromStorage= await _storageService.getString(route.UserID);

      // get userId from currentUser in the baseModel
      final jobPosterId = _authenticationService.currentUser != null
          ? _authenticationService.currentUser.id
          : idFromStorage != null ? idFromStorage : null;

      // get length of file uploaded
      await _storageService.getInt(route.LengthOfFileUploaded).then((value) {
        noOfFileUploaded = value;
        notifyListeners();
        // get single file uploaded
      });
      singleFileUploaded= await _storageService.getString(route.PostJobFilePath);

      // to get multiple file uploaded
      if (noOfFileUploaded > 0) {
          await _storageService.getList('${route.PostJobMultiplePaths}+$noOfFileUploaded').then((
              value) {
            for (var i=0;i<noOfFileUploaded;i++ ){
              print('val in multipleFileUploaded: $value');
              int countValue=noOfFileUploaded;
              print(currentUser.id);
            try{
              value != null
                  ?
              multipleFileUploaded[route.GiveWork +'${currentUser.id}'+'${i+1}'] = value[i]
                  : multipleFileUploaded = null;
            }catch(e){
              print(e.toString());
            }
            print('multipleFileUploaded: $multipleFileUploaded');
            notifyListeners();
            }

          });

      }
      var fileNameForSingle='${route.GiveWork}/${currentUser.id}\+ ${randomNumeric(3)}';

      // saving files to shared preference for the job page use
      await _storageService.setUser(route.JobBudget, budget);
      await _storageService.setUser(route.SelectedTrade, tradePage);
      await _storageService.setUser(route.JobPosterLocation, location);
      await _storageService.setUser(route.JobDescription, jobDescription);
      await _storageService.setUser(route.JobDuration,duration);
      await _storageService.setUser(route.JobPosterLocation,location);
      await _storageService.setUser(route.PostJobFilePath,fileNameForSingle);
      await _storageService.setUser(route.PostJobMultiplePaths,multipleFileUploaded);


      final jobDetails = PostJobDetails(
          jobType: jobType,
          jobDescription: jobDescription,
          location: location,
          budget: budget,
          duration: duration,
          time: timeCurrently,
          date: dateCurrently,
          jobPosterId: jobPosterId,
          postJobFilePath: singleFileUploaded,
          noOfFilePosted: noOfFileUploaded,
          postJobMultiplePaths: multipleFileUploaded);
      await _fireStore.saveData(
          jobDetails.toJson(), "${route.GiveWork + "" + tradePage}"
      );

      jobDetails.toJson().forEach((key, value) async {
        await _storageService.setUser(key, value);
      });

      if (noOfFileUploaded == 0) { await _firebase.uploadAnyFile(
          fileNameForSingle, File(singleFileUploaded));
      return await _navigationService.nextPage(route.MyJobPageRoute);
     }
     else if (noOfFileUploaded > 0) {
        multipleFileUploaded.forEach((key, value) {
          _firebase.uploadAnyFile(
              '$key', File(value));
        });
        userIdentity=true;
        notifyListeners();
        await _navigationService.nextPage(route.MyJobPageRoute);
      }

    }
  }

  // get saved data
  getSelected() async{
    selectedTrade=await _storageService.getString(route.SelectedTrade)?? 'dare';
    locationValue=await _storageService.getString(route.JobPosterLocation);
    notifyListeners();
  }

// get jobPoster database from his uid
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

  QuerySnapshot query;
  // to wait for page to load

// get data from fireStore to find Job page
  listenToPosts() {
    _fireStore.listenToJobPosterDataRealTime(collectionName).listen((data) {
      List<PostJobDetails> updatedData = data;
      print(data);
      if (updatedData != null && updatedData.length > 0) {
        _jobDetails = updatedData;
        print('_jobDetails: $_jobDetails');
        notifyListeners();
      }

      setState(ViewState.Idle);
    });
  }

// navigating to JobDescription page
  jobDescriptionNavigation(arguments) async {
    return await _navigationService.navigateTo(
        route.JobDescriptionPageRoute, arguments: arguments);
  }

  // performing string operation
  stringOperation(int a, document) {
    List mainString = document.jobDescription.split(' ');
    var stringToList = mainString.sublist(
      a > mainString.length || a < 0 ? 0 : a,
    );
    var finalString = stringToList.join(' ');
    return finalString;
  }


  hideControllerFunction() {
    hideLabelController.addListener(() {
      if (hideLabelController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_visible == false) {
          _visible = true;
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
      }
    });
  }

// navigation for page
  Future filePicker() async {
    return  await _navigationService.nextPage(route.FilePickerPageRoute);
  }

  // navigation for page
  Future postJob() async {
    return  await _navigationService.nextPage(route.PostJobPageRoute);
  }

  // get uploaded document to display in the attachment
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

  // to know if it is the owner that is accessing the post
  setUseIdentity(value){
    userIdentity=value;
    notifyListeners();
  }



  final StreamController
       _timerStream = StreamController.broadcast(sync: true);
  Stream get timerStream=>_timerStream.stream;


 Stream loadingWidget(){
    final cd = CountdownTimer(Duration(seconds: 15), Duration(seconds: 1));
    cd.listen((data) {
        _elapsed = cd.elapsed.inSeconds;
        _timerStream.add(_elapsed);
        notifyListeners();
    }, onDone: () {
      cd.cancel();
    });
    return _timerStream.stream;
  }

  listenToTimer(){
   loadingWidget().listen((data){
     _elapsed=data;
     notifyListeners();
   });
   print('$elapsed');
  }


  @override
  void dispose() {
    _timer.cancel();
    _timerStream.close();
    super.dispose();
  }
}
