import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/DateTime_service.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
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



    jobTile(){
      return AdaptivePositioned(
        left: 17,
        top:130,
        child: Container(
          height: height(93),
          width: width(341),
          decoration: (BoxDecoration(color: Colors.white,
              borderRadius: adaptiveBorderRadius(
                  context, radius: 11),
              boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.35),offset: Offset(5.0,5.0),
                  blurRadius: 5.0)])),
          child: Stack(children: <Widget>[
            AdaptivePositioned(
              left: 20,
              top: 5,
              child: GeneralTextDisplay(
                  '${currentDate(route.day_Month)}',
                  Color.fromRGBO(127, 127, 127, 1.0), 1, 12,
                  FontWeight.bold, 'Date time'),
            ),
            AdaptivePositioned(
              left: 255,
              top: 5,
              child: GeneralTextDisplay(
                  '${currentTime()}',
                  Color.fromRGBO(127, 127, 127, 1.0), 1, 12,
                  FontWeight.bold, 'time date'),
            ),
            AdaptivePositioned(
              left:20 ,
              top: 36,
              child: Container(
                height: height(46),
                width: width(60),
                decoration: BoxDecoration(image: DecorationImage(
                  image: AssetImage('assets/office.jpg'),fit:BoxFit.cover ,
                ),borderRadius: adaptiveBorderRadius(context,radius: 11)),
              ),
            ),

            AdaptivePositioned(
              left: 90,
              top: 39,
              child: GeneralTextDisplay(
                  'Ajazira Kumai', Colors.black, 2, 14, FontWeight.bold, 'job giver'),
            ),
            AdaptivePositioned(
              left: 90,
              top: 62,
              child: GeneralTextDisplay(
                  'Abuja', Color.fromRGBO(127, 127, 127, 1.0), 1, 12, FontWeight.w400, 'Job giver location'),
            ),
            AdaptivePositioned(
              left: 254,
              top: 39,
              child: GeneralTextDisplay(
                  '#3000', Colors.black, 1, 14, FontWeight.bold, 'job giver price'),
            ),
          ],),

        ),
      );

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
                height: height(120),
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
                      left: 60,
                      top: 12,
                      child: Container(
                        width: width(230),
                        height: height(35),
                        alignment: Alignment.center,
                        child: GeneralTextDisplay('DataScience,', Colors.white, 1, 20,
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
                      top: 70,
                      child: Container(
                        width: width(355),
                        height: height(40),
                        decoration: BoxDecoration(
                            color: Colors.white30,
                            borderRadius:
                            adaptiveBorderRadius(context, radius: 11)),
                        alignment: Alignment.center,
                        child: GeneralTextDisplay('Available Jobs', Colors.black54,
                            1, 15, FontWeight.w600, 'Available Jobs'),
                      ),
                    ),

                  ],
                )),
          ),
          jobTile()

        ],
    )
    ));
  }
}
