import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/Auth_service.dart';
import 'package:mergeme/Model/Service/Navigator_service.dart';
import 'package:mergeme/Model/Service/dialog_service.dart';
import 'package:mergeme/Model/Service/localStorage_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:mergeme/Model/enums/viewstate.dart';


import 'BaseModel.dart';

class SignUpViewModel extends BaseModel {
  final NavigatorService _navigationService = locator<NavigatorService>();
  final LocalStorageService storageService =locator<LocalStorageService>();

  Future loginPage(){
    return _navigationService.nextPage(route.LoginRoute);
  }

  Future landingPage(){
    return _navigationService.nextPage(route.LandingPageRoute);
  }

  Future login({bool success = true}) async {
    setState(ViewState.Busy);
    await Future.delayed(Duration(seconds: 1));

    if (!success) {
      setErrorMessage('Error has occured with the login');
    } else {
      _navigationService.navigateTo(route.HomeRoute, arguments: '\nFilledStacks');
      setErrorMessage(null);
    }

    setState(ViewState.Idle);
  }

  void validateForm(GlobalKey<FormState> formKey, Map<String,dynamic> inputValues,email,password) async{
    if(formKey.currentState.validate()) {
      signUp(email: email, password: password);
      inputValues.forEach((key, value) async { await storageService.setUser(key, value);});
    }

  }

  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();


  Future signUp({
    @required String email,
    @required String password,
  }) async {
    setState(ViewState.Busy);

    var result = await _authenticationService.signUpWithEmail(
      email: email,
      password: password,
    );

    setState(ViewState.Idle);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(route.LandingPageRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result,
      );
    }
  }


}