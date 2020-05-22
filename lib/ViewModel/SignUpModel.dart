import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/Navigator_service.dart';
import 'package:mergeme/Model/Service/localStorage_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:mergeme/Model/enums/viewstate.dart';
import 'package:mergeme/Views/Uielements/Generaldropdowndisplay.dart';
import 'package:mergeme/Views/Uielements/sizedBox.dart';

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

  void validateForm(GlobalKey<FormState> formKey, Map<String,dynamic> inputValues) async{
    if(formKey.currentState.validate()) {
      inputValues.forEach((key, value) async { await storageService.setUser(key, value);});
    var value= await storageService.getData('name');
    await print(value);
    await landingPage();
    }

  }

  Widget tradeSelection(){
    dynamic trade=storageService.getData(route.trade);
    if (trade=='Search for work' || trade =='Learn a trade'){
      return Column(children: <Widget>[
        AdaptiveSizedBox(height: 5/667,),
        GeneralDropDownDisplay(
            'Select trade category',
            ['',
              'Local Trade',
              'Tech Jobs',
              'Artisans',
              'Repairs'
            ],
            route.tradeCategory,
            'Choose a Trade',
            'Trade Category'),
      ],);

    }
    return Container(
      height: 2,

    );

  }
}