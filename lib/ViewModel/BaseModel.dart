import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/Auth_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/UserModel/userModel.dart';
import 'package:mergeme/Model/enums/viewstate.dart';


class BaseModel with ChangeNotifier {
  ViewState _state = ViewState.Idle;
  bool loading=true;

  String _errorMessage;
  ViewState get state => _state;
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
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
}