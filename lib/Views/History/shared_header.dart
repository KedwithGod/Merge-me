import 'package:flutter/material.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generalicondisplay.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';

class SharedHeader extends StatelessWidget {
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
    return SafeArea(
        child: Stack(
          children: <Widget>[

            AdaptivePositioned(
            left: 0,
            top: 0,
            child: Container(
                height: height(117),
                width: width(375),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(238, 83, 79, 1.0),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(height(30)),
                        bottomRight: Radius.circular(
                          height(30),
                        ))),
                child: Stack(children: [

                  AdaptivePositioned(
                    left: 4,
                    top: 24,
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
                    left: 40,
                    top: 11,
                    child: Container(
                      width: width(230),
                      height: height(35),
                      alignment: Alignment.center,
                      child: GeneralTextDisplay('My Projects' , Colors.white, 1, 20,
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



                ])))


          ],
        ));
  }
}
