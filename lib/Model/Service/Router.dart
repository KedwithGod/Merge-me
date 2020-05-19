import 'package:flutter/material.dart';
import 'package:mergeme/Model/constants/route_path.dart' as routes;
import 'package:mergeme/Views/NewUser/Home.dart';
import 'package:mergeme/Views/NewUser/LoginPae.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.LoginRoute:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case routes.HomeRoute:
      return MaterialPageRoute(builder: (context) => Home());
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
