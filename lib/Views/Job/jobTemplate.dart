import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mergeme/Model/constants/drawer.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generalicondisplay.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';
import 'package:mergeme/Views/Uielements/sizedBox.dart';

class JobTemplate extends StatelessWidget {

  evaluate(){
    return Firestore.instance.collection("Merge me").document('Users').get().then((value){
      print(value.data['No of Users']);
    });
  }

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
        child: Stack(
          children: <Widget>[
            AdaptivePositioned(
              left: 0,
              top: 0,
              child: Container(
                  width: width(375),
                  height: height(134),
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(238, 83, 79, 1.0)),
                  child: Stack(
                    children: <Widget>[
                      AdaptivePositioned(
                        left: 14,
                        top: 20,
                        child: Builder(builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {
                              evaluate();
                              Scaffold.of(context).openDrawer();
                            },
                            child: GeneralIconDisplay(Icons.menu, Colors.white,
                                Key('drawer_icon on trade page'), 20 / 667),
                          );

                        } ),
                      ),
                      AdaptivePositioned(
                        left: 80,
                        top: 12,
                        child: Container(
                          width: width(179),
                          height: height(35),
                          alignment: Alignment.center,
                          child: GeneralTextDisplay(
                              'Data Science',
                              Colors.white,
                              1,
                              23,
                              FontWeight.bold,
                              'trade page title'),
                        ),
                      ),
                      AdaptivePositioned(
                        left: 294,
                        top: 19,

                          child: GeneralIconDisplay(Icons.notifications,
                              Colors.white, Key('notification'), 24 / 667),

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
                        top: 73,
                        child: Container(
                          width: width(355),
                          height: height(48),
                          decoration: BoxDecoration(color: Colors.white,borderRadius: adaptiveBorderRadius(context,radius:11)),
                          alignment: Alignment.center,
                          child: GeneralTextDisplay(
                              'Available Traders',
                              Colors.black,
                              1,
                              20,
                              FontWeight.w600,
                              'Available trade'),
                        ),
                      )
                    ],
                  )),
            ),
            AdaptivePositioned(
              left: 11,
              top: 147,
              child: AdaptiveSizedBox(
                height: 82 / 667,
                width: 355 / 375,
                child: Material(
                  elevation: 12.0,
                  borderRadius: adaptiveBorderRadius(context, radius: 8),
                  shadowColor: Color.fromRGBO(170, 170, 170, 1.0),
                  color: Colors.white,
                  animationDuration: Duration(seconds: 3),
                  child: Stack(
                    children: <Widget>[
                      AdaptivePositioned(
                        left: 5,
                        top: 6,
                        child: Container(
                          width: height(70),
                          height: height(70),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/office.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      AdaptivePositioned(
                        left: 100,
                        top: 15,

                          child: GeneralTextDisplay(
                              'Kareem Ayomide',
                              Colors.black,
                              1,
                              15,
                              FontWeight.w400,
                              'Trader name'),

                      ),
                      AdaptivePositioned(
                        left: 106,
                        top: 40,
                        child: Container(
                          width: width(69),
                          height: height(2),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(238, 83, 79, 1.0)),
                        ),
                      ),

                      AdaptivePositioned(
                        left: 112,
                        top: 50,
                        child: Container(
                          width: width(10),
                          height: height(12),
                          child: Hero(
                            tag: 'location123',
                            child: GeneralIconDisplay(Icons.location_on,
                                Color.fromRGBO(127, 127, 127, 1.0), Key('location'), 12 / 667),
                          ),
                        ),
                      ),
                      AdaptivePositioned(
                        left: 130,
                        top: 47,
                          child: GeneralTextDisplay(
                              'Abuja',
                              Color.fromRGBO(51, 51, 51, 1.0),
                              1,
                              12,
                              FontWeight.w400,
                              'location name'),

                      ),
                      AdaptivePositioned(
                        left: 253,
                        top: 38,
                        child: Container(
                          width: width(15),
                          height: height(12),
                          child: GeneralIconDisplay(Icons.star,
                              Color.fromRGBO(238, 83, 79, 1.0), Key('Star'), 12 / 667),
                        ),
                      ),
                      AdaptivePositioned(
                        left: 277,
                        top: 37,

                          child: GeneralTextDisplay(
                              '4.3 Rating',
                              Colors.black,
                              1,
                              10,
                              FontWeight.bold,
                              'Rating'),


                      ),
                      AdaptivePositioned(
                        left: 268,
                        top: 63,

                          child: GeneralTextDisplay(
                              'Recommended',
                              Color.fromRGBO(163, 0, 20, 1.0),
                              1,
                              8,
                              FontWeight.w400,
                              'location name'),

                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
