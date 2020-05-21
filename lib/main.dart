import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mergeme/Model/Service/Navigator_service.dart';
import 'package:mergeme/Model/Service/Router.dart' as router;
import 'package:mergeme/Model/constants/route_path.dart' as routes;
import 'Model/Service/locator_setup.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),backgroundColor: Colors.white,
        primarySwatch: Colors.yellow,
      ),
     navigatorKey: locator<NavigatorService>().navigatorKey,
     onGenerateRoute: router.generateRoute,
      initialRoute: routes.HomeRoute,
    );
  }
}

