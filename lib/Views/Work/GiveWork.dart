import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/Auth_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/UserModel/userModel.dart';
import 'package:mergeme/Model/constants/drawer.dart';
import 'package:mergeme/Views/Work/workTemplate_page.dart';
import 'package:provider/provider.dart';


class GiveWork extends StatelessWidget {
  final AuthenticationService _authService =locator<AuthenticationService>();



  @override
  Widget build(BuildContext context) {


    final userLocation = Provider.of<UserLocation>(context);
    return Scaffold(

      body:SafeArea(
        child: WorkTemplate('Give out work', 'trader', 0),
      )
    );
  }
}




