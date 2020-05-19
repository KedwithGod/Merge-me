import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mergeme/Views/NewUser/LoginPae.dart';
import 'Model/Service/locator_setup.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupLocator();
  runApp(MyApp());

}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),backgroundColor: Colors.white,
        primarySwatch: Colors.yellow,
      ),
     onGenerateRoute: router
    );
  }
}

