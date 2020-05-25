import 'package:flutter/material.dart';
import 'package:mergeme/Model/constants/route_path.dart' as routes;
import 'package:mergeme/Views/NewUser/HomePage.dart';
import 'package:mergeme/Views/NewUser/LoginPage.dart';
import 'package:mergeme/Views/NewUser/SignUpPage.dart';
import 'package:mergeme/Views/NewUser/wrapper.dart';
import 'package:mergeme/Views/Onboarding/GiveWork.dart';
import 'package:mergeme/Views/Onboarding/LearnTrade.dart';
import 'package:mergeme/Views/Onboarding/SearchJob.dart';
import 'package:mergeme/Views/Work/Landingpage.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.LoginRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case routes.HomeRoute:
      return MaterialPageRoute(builder: (context) => Home());
    case routes.WrapperRoute:
      return MaterialPageRoute(builder: (context) => Wrapper());
    case routes.SignUpRoute:
      return MaterialPageRoute(builder: (context) => SignUp());
    case routes.LandingPageRoute:
      return MaterialPageRoute(builder: (context) => LandingPage());
    case routes.OnBoardingGiveWork:
      return MaterialPageRoute(builder: (context) => GiveWorkOnBoarding());
    case routes.OnBoardingSearchWork:
      return MaterialPageRoute(builder: (context) => SearchWorkOnBoarding());
    case routes.OnBoardingLearnTrade:
      return MaterialPageRoute(builder: (context) => LearnTradeOnBoarding());

    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      );
  }
}
