import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/Auth_service.dart';
import 'package:mergeme/Model/Service/Navigator_service.dart';
import 'package:mergeme/Model/Service/localStorage_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/UserModel/userModel.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:mergeme/Model/enums/viewstate.dart';
import 'package:provider/provider.dart';
import 'BaseModel.dart';


class HomeViewModel extends BaseModel {
  final NavigatorService _navigationService = locator<NavigatorService>();
  final LocalStorageService storageService =locator<LocalStorageService>();
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  userLocation(context) async{
    await _authenticationService.welcomeBack();
    return  Provider.of<UserLocation>(context,listen:false);
  }

  updateUser(){
    return _authenticationService.currentUser;
  }

  get update => _authenticationService.welcomeBack();

  Future landingPage() {
    return _navigationService.nextPage(route.LandingPageRoute);
  }

 Future login(){
    return _navigationService.nextPage(route.LoginRoute);
  }

  Future signUp(){
    return _navigationService.nextPage(route.SignUpRoute);
  }

  Future logout({bool success = true}) async {
    await Future.delayed(Duration(seconds: 1));
    setState(ViewState.Busy);
    if (!success) {
      setErrorMessage('Error has occured during sign out');
    } else {
      _navigationService.goBack();
    }
    setState(ViewState.Idle);
  }


}