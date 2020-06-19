

import 'package:flutter/material.dart';

class NavigatorService{
    final GlobalKey<NavigatorState> navigatorKey=
        GlobalKey<NavigatorState>();

    Future<dynamic> navigateTo(String routeName, {dynamic arguments}){
      return navigatorKey.currentState.pushNamed(routeName,arguments: arguments);
    }

    void goBack (){
      return navigatorKey.currentState.pop();
    }

    Future nextPage(String routeName){
      return navigatorKey.currentState.pushNamed(routeName);
    }

}