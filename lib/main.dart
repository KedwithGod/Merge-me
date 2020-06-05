import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './Model/Service/Navigator_service.dart';
import './Model/Service/Router.dart' as router;
import './Model/constants/route_path.dart' as routes;
import 'package:provider/provider.dart';
import 'Model/Service/Auth_service.dart';
import 'Model/Service/dialog_service.dart';
import 'Model/Service/location_service.dart';
import 'Model/Service/locator_setup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Model/UserModel/userModel.dart';
import 'ViewModel/DropDownButton.dart';
import 'Views/Uielements/dialog_manager.dart';

void main() async {
   setupLocator();
    runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    mainBloc =
        MainBloc(); // initializing mainBloc. It will be availible to all widgets underdeath; that is All the app.
  }

  @override
  void dispose() {
    mainBloc = null; // destroying the mainBloc object to free resources
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return  MultiProvider(providers: [
      StreamProvider<UserLocation>(
          create: (context) => LocationService().locationStream),
      StreamProvider<UserId>.value(
          value: AuthenticationService().userValue),

    ],
            child:MaterialApp(
        title: 'Merge Me',
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.openSansTextTheme(
            Theme.of(context).textTheme,
          ),backgroundColor: Colors.pink,
          primarySwatch: Colors.yellow,
        ),
       navigatorKey: locator<NavigatorService>().navigatorKey,
       onGenerateRoute: router.generateRoute,
        initialRoute: routes.WrapperRoute,
      ));
  }
}

