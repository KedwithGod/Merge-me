import 'package:flutter/material.dart';
import 'package:mergeme/Model/UserModel/userModel.dart';
import 'package:mergeme/Views/NewUser/welcome.dart';
import 'package:mergeme/Views/Onboarding/GiveWork.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  Widget build(BuildContext context) {
    final user = Provider.of<UserId>(context);

    // return either the Home or Authenticate widget
    if (user == null){
      return GiveWorkOnBoarding();
    } else {
      return WelcomeBack();
    }
  }
}
