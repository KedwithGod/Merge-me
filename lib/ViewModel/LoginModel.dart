import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/Auth_service.dart';
import 'package:mergeme/Model/Service/Navigator_service.dart';
import 'package:mergeme/Model/Service/dialog_service.dart';
import 'package:mergeme/Model/Service/localStorage_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:mergeme/Model/enums/viewstate.dart';


import 'BaseModel.dart';

class LoginViewModel extends BaseModel {
  final NavigatorService _navigationService = locator<NavigatorService>();
  final LocalStorageService storageService =locator<LocalStorageService>();
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  bool loading=false;

  Future signUp(){
    return _navigationService.nextPage(route.SignUpRoute);
  }

  Future landingPage(){
    return _navigationService.nextPage(route.LandingPageRoute);
  }



  final DialogService _dialogService = locator<DialogService>();
  Future loginUser({
    @required String email,
    @required String password,
  }) async {
    setState(ViewState.Busy);

    var result = await _authenticationService.loginWithEmail(
      email: email,
      password: password,
    );

    setState(ViewState.Idle);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(route.LandingPageRoute);
      } else {
        loading=false;
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'General login failure. Please try again later',
        );
      }
    } else {
      loading=false;
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }

  void validateForm(GlobalKey<FormState> formKey, Map<String,dynamic> inputValues,email,password) async{
    if(formKey.currentState.validate()) {
      loading=true;
      loginUser(email: email, password: password);
      storageService.setUser(route.isLoggedIn, true);
      inputValues.forEach((key, value) async {
        await storageService.setUser(key, value);
      });

    }

  }
}