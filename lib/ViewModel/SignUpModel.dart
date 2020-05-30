import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/Auth_service.dart';
import 'package:mergeme/Model/Service/Navigator_service.dart';
import 'package:mergeme/Model/Service/dialog_service.dart';
import 'package:mergeme/Model/Service/localStorage_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/UserModel/userModel.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:mergeme/Model/enums/viewstate.dart';
import 'package:provider/provider.dart';

import 'BaseModel.dart';

class SignUpViewModel extends BaseModel {
  final NavigatorService _navigationService = locator<NavigatorService>();
  final LocalStorageService storageService = locator<LocalStorageService>();
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();

  bool loading=false;

  Future loginPage() {
    return _navigationService.nextPage(route.LoginRoute);
  }

  Future landingPage() {
    return _navigationService.nextPage(route.LandingPageRoute);
  }

  Future login({bool success = true}) async {
    setState(ViewState.Busy);
    await Future.delayed(Duration(seconds: 1));

    if (!success) {
      setErrorMessage('Error has occured with the login');
    } else {
      _navigationService.navigateTo(route.HomeRoute,
          arguments: '\nFilledStacks');
      setErrorMessage(null);
    }

    setState(ViewState.Idle);
  }

  void validateForm(
      GlobalKey<FormState> formKey,
      Map<String, dynamic> inputValues,
      email,
      password,
      fullName,
      mobileNo,
      workNumber,nin,tradeName,tradeCategory,tutorOption,specificTrade) async {
    if (formKey.currentState.validate()) {
      signUp( email, password,fullName,
          mobileNo,
          workNumber,nin,tradeName,tutorOption,tradeCategory,specificTrade);
      await storageService.setUser(route.isLoggedIn, true);
      inputValues.forEach((key, value) async {
        await storageService.setUser(key, value);
      });



    }
  }


  Future signUp(
      String email,
      String password,
      String fullName,
      String mobileNo,
      String workNumber,
      String nin,
      String tradeName,
      String tutorOption,
      String tradeCategory,
      String specificTrade,
      ) async {
    setState(ViewState.Busy);

    var result = await _authenticationService.signUpWithEmail(
        email: email,
        password: password,
        fullName: fullName,
        mobileNo: mobileNo,
        workNumber: workNumber,
        tradeName: tradeName,
        nin: nin,
        tutorOption: tutorOption,
        tradeCategory: tradeCategory,
        specificTrade: specificTrade);


    setState(ViewState.Idle);

    if (result is bool) {
      if (result) {
        if(tradeCategory=='Give a work') return _navigationService.navigateTo(route.GiveWork);
        if(tradeCategory=='Search for work') return _navigationService.navigateTo(route.SearchWork);
        if(tradeCategory=='Learn a trade') return _navigationService.navigateTo(route.LearnTrade);
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
