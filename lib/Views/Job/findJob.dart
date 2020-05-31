import 'package:flutter/material.dart';
import 'package:mergeme/Model/constants/drawer.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generalicondisplay.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';

class FindJob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResponsiveSize dynamicSize = ResponsiveSize(context);
    // custom width
    double width(value) {
      return dynamicSize.width(value / 375);
    }

    // custom height
    double height(value) {
      return dynamicSize.height(value / 667);
    }

    return Scaffold(
      drawer: CustomDrawer(),
    body: SafeArea(
        child:Stack(
        children: <Widget>[
          AdaptivePositioned(
            left: 0,
            top: 0,
            child: Container(
                width: width(375),
                height: height(155),
                decoration: BoxDecoration(color: Color.fromRGBO(238, 83, 79, 1.0)),
                child: Stack(
                  children: <Widget>[
                    AdaptivePositioned(
                      left: 14,
                      top: 20,
                      child: Builder(builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: GeneralIconDisplay(Icons.menu, Colors.white,
                              Key('drawer_icon on trade page'), 26 / 667),
                        );
                      }),
                    ),
                    AdaptivePositioned(
                      left: 80,
                      top: 12,
                      child: Container(
                        width: width(179),
                        height: height(35),
                        alignment: Alignment.center,
                        child: GeneralTextDisplay('Data Science', Colors.white, 1, 23,
                            FontWeight.bold, 'trade page title'),
                      ),
                    ),
                    AdaptivePositioned(
                      left: 294,
                      top: 19,
                      child: GeneralIconDisplay(Icons.notifications, Colors.white,
                          Key('notification'), 24 / 667),
                    ),
                    AdaptivePositioned(
                      left: 311,
                      top: 19,
                      child: Container(
                        alignment: Alignment.center,
                        height: height(10),
                        width: height(10),
                        decoration: new BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: GeneralTextDisplay('0', Colors.white, 1, 7,
                            FontWeight.w600, '0 tile in job template'),
                      ),
                    ),
                    AdaptivePositioned(
                      left: 333,
                      top: 19,
                      child: GestureDetector(
                        onTap: () {},
                        child: GeneralIconDisplay(Icons.email, Colors.white,
                            Key('message icon in Job template'), 24 / 667),
                      ),
                    ),
                    AdaptivePositioned(
                      left: 11,
                      top: 59,
                      child: Container(
                        width: width(355),
                        height: height(48),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                            adaptiveBorderRadius(context, radius: 11)),
                        alignment: Alignment.center,
                        child: GeneralTextDisplay('Available Jobs', Colors.black,
                            1, 20, FontWeight.w600, 'Available Jobs'),
                      ),
                    )
                  ],
                )),
          ),

        ],
    )
    ));
  }
}
