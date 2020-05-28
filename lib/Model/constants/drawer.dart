import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/Auth_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/UserModel/userModel.dart';
import 'package:mergeme/ViewModel/Drawer_model.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generalicondisplay.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';
import 'package:provider/provider.dart';

import 'loading.dart';

class CustomDrawer extends StatelessWidget {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();


// drawer item widget
  Widget drawerItems(double iconTop, icon, iconKeyString, double textTop, text,
      textSemantics, onTap) {
    return Stack(

      children: <Widget>[
        AdaptivePositioned(
          left: 22,
          top: iconTop,
          child: GeneralIconDisplay(icon, Color.fromRGBO(238, 83, 79, 1.0),
              Key(iconKeyString), 20 / 667),
        ),
        GestureDetector(
          onTap: onTap,
          child: AdaptivePositioned(
            left: 78,
            top: textTop,
            child: GeneralTextDisplay(
                text, Colors.black, 1, 17, FontWeight.w400, textSemantics),
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
   final userLocation=Provider.of<UserLocation>(context);
    ResponsiveSize dynamicSize = ResponsiveSize(context);
    return ChangeNotifierProvider(
        create: (context) => DrawerModel(),
        child: Consumer<DrawerModel>(
          builder: (context, model, child) => userLocation==null?Loading():Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(

              // Overall container for the drawer
              child: Container(
                width: dynamicSize.width(335 / 375),
                height: dynamicSize.height(667 / 667),
                decoration: BoxDecoration(color: Colors.white),
                child: Stack(
                  children: <Widget>[
                    AdaptivePositioned(
                      left: 0,
                      top: 0,

                      // underLaying container for the upper part of the drawer
                      child: Container(
                        width: dynamicSize.width(335 / 375),
                        height: dynamicSize.height(181 / 667),
                        color: Color.fromRGBO(238, 83, 79, 1.0),
                        child: Stack(
                          children: <Widget>[
                            AdaptivePositioned(
                              left: 47,
                              top: 96,
                              child: GeneralIconDisplay(
                                  Icons.location_on,
                                  Colors.white,
                                  Key('drawer icon location'),
                                  20 / 667),
                            ),
                            AdaptivePositioned(
                                left: 32,
                                top: 128,
                                child: GeneralTextDisplay(
                                    userLocation.locality==null?'':userLocation.locality,
                                    Colors.white,
                                    1,
                                    14,
                                    FontWeight.bold,
                                    'drawer location subtitle')),
                            AdaptivePositioned(
                              left: 107,
                              top: 101,
                              child: Container(
                                width: dynamicSize.width(2 / 375),
                                height: dynamicSize.height(52 / 667),
                                color: Colors.white,
                              ),
                            ),
                            AdaptivePositioned(
                              left: 150,
                              top: 96,
                              child: GeneralIconDisplay(
                                  Icons.settings_input_composite,
                                  Colors.white,
                                  Key('project/job drawer icon'),
                                  20 / 667),
                            ),
                            AdaptivePositioned(
                              left: 125,
                              top: 128,
                              child: GeneralTextDisplay(
                                  '17 Projects',
                                  Colors.white,
                                  1,
                                  14,
                                  FontWeight.bold,
                                  'drawer projects/job subtitle'),
                            ),
                            AdaptivePositioned(
                                left: 145,
                                top: 148,
                                child: GeneralTextDisplay(
                                    '3 Jobs',
                                    Colors.white,
                                    1,
                                    14,
                                    FontWeight.bold,
                                    'drawer projects/job third line')),
                            AdaptivePositioned(
                              left: 224,
                              top: 101,
                              child: Container(
                                width: dynamicSize.width(2 / 375),
                                height: dynamicSize.height(52 / 667),
                                color: Colors.white,
                              ),
                            ),
                            AdaptivePositioned(
                              left: 256,
                              top: 97,
                              child: GeneralIconDisplay(
                                  Icons.credit_card,
                                  Colors.white,
                                  Key('credit Card icon_drawer'),
                                  20 / 667),
                            ),
                            AdaptivePositioned(
                              left: 236,
                              top: 128,
                              child: GeneralTextDisplay(
                                  '01235869',
                                  Colors.white,
                                  1,
                                  14,
                                  FontWeight.bold,
                                  'credit card subtitle'),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // overlaying container for the upper part of the drawer
                    AdaptivePositioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: dynamicSize.width(335 / 375),
                        height: dynamicSize.height(72 / 667),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(217, 0, 27, 1.0)),
                        child: Stack(
                          children: <Widget>[
                            AdaptivePositioned(
                              left: 17,
                              top: 10,
                              child: Container(
                                width: dynamicSize.height(55 / 667),
                                height: dynamicSize.height(55 / 667),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage('assets/office.jpg'),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            AdaptivePositioned(
                              left: 96,
                              top: 24,
                              child: Container(
                                width: dynamicSize.width(158 / 357),
                                alignment: Alignment.center,
                                child: GeneralTextDisplay(
                                    _authenticationService.currentUser.fullName==null?'Name':
                                    _authenticationService.currentUser.fullName,
                                    Colors.white,
                                    1,
                                    18,
                                    FontWeight.bold,
                                    'drawer name'),
                              ),
                            ),
                            AdaptivePositioned(
                              left: 277,
                              top: 24,
                              child: GeneralIconDisplay(
                                  Icons.settings,
                                  Colors.white,
                                  Key('drawer icon settings'),
                                  25 / 667),
                            ),
                          ],
                        ),
                      ),
                    ),


                    // drawer item lists
                    drawerItems(198, Icons.home, 'Home_icon', 196, 'Home',
                        'home_subtitle', () {
                      model.landingPage();
                        }),
                    drawerItems(
                        237,
                        Icons.account_balance_wallet,
                        'wallet_icon',
                        235,
                        'Wallet',
                        'Wallet_subtitle',
                        () {}),
                    drawerItems(276, Icons.person, 'person_icon', 273,
                        'Profile', 'profile_subtitle', () {}),
                    drawerItems(315, Icons.group_work, 'project_icon', 315,
                        'Projects', 'Projects_subtitle', () {}),
                    drawerItems(357, Icons.work, 'Job_icon', 354, 'Job',
                        'Job_subtitle', () {}),
                    drawerItems(397, Icons.book, 'learning_icon', 396,
                        'Learning page', 'Learning_subtitle', () {}),
                    drawerItems(439, Icons.phonelink_setup, "Job_icon", 436,
                        'Job updates', 'job_subtitle', () {}),
                    drawerItems(481, Icons.feedback, 'feedback_icon', 478,
                        'Feedback', 'Feedback_subttitle in drawer', () {}),
                    drawerItems(
                        523,
                        Icons.transfer_within_a_station,
                        "SignOut_icon",
                        520,
                        'Sign out',
                        'Signout_subtitle', () {
                      model.signOut();
                    }),

                    // The merge me logo underneath every thing

                    AdaptivePositioned(
                      left: 22,
                      top: 600,
                      child: Container(
                        width: dynamicSize.width(30 / 375),
                        height: dynamicSize.height(30 / 667),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/Merge.PNG'),
                                fit: BoxFit.contain)),
                      ),
                    ),
                    AdaptivePositioned(
                      left: 54,
                      top: 611,
                      child: GeneralTextDisplay(
                          'erge me',
                          Color.fromRGBO(85, 85, 85, 1.0),
                          1,
                          14,
                          FontWeight.w400,
                          'logo_subtitle'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
