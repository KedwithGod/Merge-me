import 'package:flutter/material.dart';
import 'package:mergeme/Model/constants/route_path.dart' as routes;
import 'package:mergeme/Views/Job/findJob.dart';
import 'package:mergeme/Views/Job/postJob.dart';
import 'package:mergeme/Views/History/MyJobPage.dart';
import 'package:mergeme/Views/Job/Job_description.dart';
import 'package:mergeme/Views/NewUser/HomePage.dart';
import 'package:mergeme/Views/NewUser/LoginPage.dart';
import 'package:mergeme/Views/NewUser/SignUpPage.dart';
import 'package:mergeme/Views/NewUser/welcome.dart';
import 'package:mergeme/Views/NewUser/wrapper.dart';
import 'package:mergeme/Views/Onboarding/GiveWork.dart';
import 'package:mergeme/Views/Onboarding/LearnTrade.dart';
import 'package:mergeme/Views/Onboarding/SearchJob.dart';
import 'package:mergeme/Views/Work/GiveWork.dart';
import 'package:mergeme/Views/Work/Landingpage.dart';
import 'package:mergeme/Views/Work/learnTrade.dart';
import 'package:mergeme/Views/Work/searchWork.dart';

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
    case routes.GiveWork:
      return MaterialPageRoute(builder: (context) => GiveWorkPage());
    case routes.welcomeBack:
      return MaterialPageRoute(builder: (context) => WelcomeBack());
    case routes.LearnTrade:
      return MaterialPageRoute(builder: (context) => LearnTradePage());
    case routes.SearchWork:
      return MaterialPageRoute(builder: (context) => SearchWorkPage());
    case routes.LandingPageRoute:
      return MaterialPageRoute(builder: (context) => LandingPage());
    case routes.OnBoardingGiveWork:
      return MaterialPageRoute(builder: (context) => GiveWorkOnBoarding());
    case routes.OnBoardingSearchWork:
      return MaterialPageRoute(builder: (context) => SearchWorkOnBoarding());
    case routes.OnBoardingLearnTrade:
      return MaterialPageRoute(builder: (context) => LearnTradeOnBoarding());
    case routes.MyJobPageRoute:
      return MaterialPageRoute(builder: (context) => MyJobPage());
    case routes.JobDescriptionPageRoute:
    case routes.PostJobPageRoute:
    var specificTrade = settings.arguments as String;
      return MaterialPageRoute(builder: (context) => PostJobPage(specificTrade));
    case routes.FindJobPageRoute:
      var specificTrade = settings.arguments as String;
      return MaterialPageRoute(builder: (context) => FindJobPage(specificTrade));




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
