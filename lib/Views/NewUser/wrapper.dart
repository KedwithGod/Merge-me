import 'package:flutter/material.dart';
import 'package:mergeme/ViewModel/HomeModel.dart';
import 'package:mergeme/Views/NewUser/welcome.dart';
import 'package:mergeme/Views/Onboarding/GiveWork.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: Consumer<HomeViewModel>(
            builder: (context, model, child) =>
                model.getData == false ? GiveWorkOnBoarding() : WelcomeBack()));
  }
}
