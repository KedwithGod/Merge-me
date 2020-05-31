import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/Bloc_settings.dart';
import 'package:mergeme/Model/constants/drawer.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:mergeme/ViewModel/DropDownButton.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generalicondisplay.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';
import 'package:mergeme/Views/Uielements/sizedBox.dart';
import 'package:random_string/random_string.dart';


class LandingPage extends StatelessWidget {
  final listController = ScrollController();



    @override
  Widget build(BuildContext context) {
    ResponsiveSize dynamicSize = ResponsiveSize(context);
    return  Scaffold(
      drawer: CustomDrawer(),
      body:
      SafeArea(
              child: Stack(children: <Widget>[
            AdaptivePositioned(
              left: 0,
              top: 0,
              child: Container(
                height: dynamicSize.height(65 / 667),
                width: dynamicSize.width(375 / 375),
                decoration: BoxDecoration(color: Color.fromRGBO(238, 83, 79, 1.0),
                  boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],),

                child: Row(
                  children: <Widget>[
                    AdaptiveSizedBox(
                      width: 11 / 375,
                    ),
                Builder(builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: GeneralIconDisplay(
                        Icons.menu, Colors.white, Key('drawerKey'),
                        26 / 667),
                  );

                }),
                    AdaptiveSizedBox(
                      width: 11 / 375,
                    ),
                    GeneralTextDisplay(
                        'What would you like to do today',
                        Colors.white,
                        1,
                        17,
                        FontWeight.bold,
                        'Landing page title')
                  ],
                ),
              ),
            ),
            AdaptivePositioned(
              left: 2,
              top: 74,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: adaptiveBorderRadius(context, radius: 11),
                    border: Border.all(
                        width: 1.0, color: Color.fromRGBO(232, 232, 232, 1.0))),
                height: dynamicSize.height(320 / 667),
                width: dynamicSize.width(370 / 375),
              ),
            ),
                StatesBuilder(
                  stateID: 'indexStack' ,
                  blocs: [mainBloc],
                  builder: (_) =>
                      IndexedStack(index:
                      mainBloc.indexValue,
                children: <Widget>[
                  index0(),
                  index1(),
                  index2()
                ],
              ),
            ),


            Positioned(
                left: dynamicSize.width(12/375),
                top: dynamicSize.height(370/667),
                right: dynamicSize.width(12/375),
                bottom: 0,
                child: AdaptiveSizedBox(
                  height:260/667 ,
                  child:
                       ListView(
                         key: Key(randomString(8)),
                         physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              landingPageTile(
                                  context,
                                  '1','App Tutorial',
                                  'Visit our youtube\nchannel via the link\nbelow on how to\neffectively use this\napp',true),
                              AdaptiveSizedBox(width:6/375),
                              landingPageTile(context, '2', 'Profile update',
                                  'Visit your profile to\nadd necessary infors\nfor clients to spot you,\nclick the on       the\ndrawer page.', false,
                                  child: AdaptivePositioned(
                                    left: 105,
                                      top: 125,
                                      child: GeneralIconDisplay(
                                          Icons.settings, Colors.black,
                                          Key('settings in profile update'), 10/375))),
                              AdaptiveSizedBox(width:6/375),
                              landingPageTile(context, '3', 'Notification', 'No new nofication\nrecieved', false),
                              AdaptiveSizedBox(width:6/375),
                              landingPageTile(context, '4', 'No of users', 'The no of people\nusing this app are', false,
                              child: AdaptivePositioned(
                                left:16 ,
                                top:108 ,
                                child: StreamBuilder(
                                  stream:  Firestore.instance.collection("Merge me").document('Users').snapshots(),
                                  builder: (context, snapshot) {
                                    if(!snapshot.hasData){
                                      return Container();
                                    }
                                    if (snapshot.hasData)
                                    return GeneralTextDisplay('${snapshot.data[route.NoOfUser]}', Colors.black,1, 13, FontWeight.bold, 'no of user');
                                    return Container();
                                  }
                                ) ,
                              ))
                            ],
                          )
                        ],
                           ),


                )),
          ])),
    );
  }
}
