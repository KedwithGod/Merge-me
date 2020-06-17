import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/Auth_service.dart';
import 'package:mergeme/Model/Service/localStorage_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/UserModel/userModel.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:mergeme/Model/enums/viewstate.dart';


class BaseModel with ChangeNotifier {
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  final LocalStorageService storageService =locator<LocalStorageService>();



  ViewState _state = ViewState.Idle;
  bool loading=true;
  String _errorMessage;
  ViewState get state => _state;
  bool netStat;
  BuildContext context;
  var notificationValue;
  var notification;
  var jobPoster;
  bool isLoggedIn=false;
  bool onBidClicked=true;

  User get currentUser => _authenticationService.currentUser;

  String get errorMessage => _errorMessage;
  bool get hasErrorMessage => _errorMessage != null && _errorMessage.isNotEmpty;

  setBidClicked(){
    onBidClicked=!onBidClicked;
    notifyListeners();
  }

  void setErrorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

    waitingFunction()async {
    await Future.delayed(Duration(seconds: 3));
    loading=false;
    notifyListeners();
  }

  getNotificationFromDataBase(){
    return StreamBuilder(
      stream: Firestore.instance.collection(route.BidFireStoreDocument).
      document(currentUser.id).snapshots(),
        builder: (context, snapshot){
        if(!snapshot.hasData){
          notificationValue=0;
          print('...notification: no data');
          notifyListeners();
        }
        if (snapshot.hasError){
          notificationValue=0;
          print('...notification: ${snapshot.error}');
          notifyListeners();
        }
        if(snapshot.hasData){
          print('...notification: ${snapshot.data}');
          return ListView.builder(
            itemCount: snapshot.data==null?0:snapshot.data[route.Notification],
              itemBuilder: (context,index){
              var neededId;
                notificationValue = snapshot.data== null
                      ? 0
                      : snapshot.data[route.Notification];
              snapshot.data == null
                  ?notification=[]:
                  snapshot.data.forEach((key,value){
                    notification.add(value);
                    notifyListeners();
                  });

              return null;
              });
        }
        return null;
        });
  }

  networkConnection(){
    DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          netStat=true;
          notifyListeners();
          return netStat;
          break;
        case DataConnectionStatus.disconnected:
          netStat=false;
          notifyListeners();
          return netStat;
          break;
      }
    return netStat;
    });
  }

  checkLogin()async{
    isLoggedIn= await storageService.getBool(route.isLoggedIn);
    notifyListeners();
  }

}