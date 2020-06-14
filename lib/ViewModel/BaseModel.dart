import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/Auth_service.dart';
import 'package:mergeme/Model/Service/Network_connection.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/UserModel/userModel.dart';
import 'package:mergeme/Model/enums/viewstate.dart';
import 'package:mergeme/main.dart';


class BaseModel with ChangeNotifier {
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();

  final Main _main =
  locator<Main>();

  ViewState _state = ViewState.Idle;
  bool loading=true;
  String _errorMessage;
  ViewState get state => _state;
  bool netStat;

  User get currentUser => _authenticationService.currentUser;

  String get errorMessage => _errorMessage;
  bool get hasErrorMessage => _errorMessage != null && _errorMessage.isNotEmpty;

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

}