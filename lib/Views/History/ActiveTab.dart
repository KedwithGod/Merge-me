import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generalbuttondisplay.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';

class ActiveTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResponsiveSize dynamicSize =ResponsiveSize(context);
    // custom width
    double width(value) {
      return dynamicSize.width(value / 375);
    }

    // custom height
    double height(value) {
      return dynamicSize.height(value / 667);
    }

    jobHalfDisplay() {
      return Stack(
        children: <Widget>[
          AdaptivePositioned(
            left: 0,
            top: 0,
            child: Container(
              height:height(98),
              width: width(346),
              decoration: BoxDecoration(color: Colors.white,
              borderRadius: adaptiveBorderRadius(context,radius: 11)),
              child: Stack(
                children: <Widget>[
                  AdaptivePositioned(
                    left: 15,
                    top: 17,
                    child: Container(
                      width: width(60),
                      height: height(46),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/office.jpg'),
                              fit: BoxFit.contain)),
                    ),
                  ),
                  AdaptivePositioned(
                    left:85,
                    top: 13,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: height(19),
                        width: width(134),
                        child: GeneralTextDisplay('Kareem Ayomide', Colors.black, 1,
                            16, FontWeight.w600, 'Name on the active page'),
                      )),
                  AdaptivePositioned(
                      left:85,
                      top: 38,
                      child: Container(
                        height: height(17),
                        width: width(134),
                        alignment: Alignment.centerLeft,
                        child: GeneralTextDisplay('Data Science', Colors.black, 1,
                            12, FontWeight.w400, 'trade type in the active page'),
                      )),
                  AdaptivePositioned(
                      left:85,
                      top: 59,
                      child: Container(
                        height: height(17),
                        width: width(134),
                        alignment: Alignment.centerLeft,
                        child: GeneralTextDisplay('2nd of May, 2020', Color.fromRGBO(127, 127, 127, 1.0), 1,
                            11, FontWeight.w600, 'Date on the active page'),
                      )),
                  AdaptivePositioned(
                      left:249,
                      top: 15,
                      child: GeneralTextDisplay('Active', Colors.black, 1,
                          16, FontWeight.bold, 'the active page')),
                  AdaptivePositioned(
                      left:249,
                      top: 12,
                      child: Container(
                        height: height(17),
                        width: width(90),
                        alignment: Alignment.centerLeft,
                        child: GeneralTextDisplay('#3,000.00', Colors.black, 1,
                            14, FontWeight.w400, 'money on the active page'),
                      )),
                ],
            ),
            ),
          ),
          AdaptivePositioned(
            left: 166,
            top: 88,
              child: GeneralIconButton(
                  Colors.black,
                  10 / 667,
                  Icon(
                    Icons.arrow_drop_down_circle, color: Colors.black,size: 10/667,
                  ),
                  Colors.grey,
                  14/667,
                  (){}))
        ],
      );
    }

    jobFullDisplay() {
        return Container(
          height:height(388),
          width: width(346),
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: adaptiveBorderRadius(context,radius: 11)),
          child: Stack(
            children: <Widget>[
              AdaptivePositioned(
                left: 15,
                top: 17,
                child: Container(
                  width: width(60),
                  height: height(46),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/office.jpg'),
                          fit: BoxFit.contain)),
                ),
              ),
              AdaptivePositioned(
                  left:85,
                  top: 13,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: height(19),
                    width: width(134),
                    child: GeneralTextDisplay('Kareem Ayomide', Colors.black, 1,
                        16, FontWeight.w600, 'Name on the active page'),
                  )),
              AdaptivePositioned(
                  left:85,
                  top: 38,
                  child: Container(
                    height: height(17),
                    width: width(134),
                    alignment: Alignment.centerLeft,
                    child: GeneralTextDisplay('Data Science', Colors.black, 1,
                        12, FontWeight.w400, 'trade type in the active page'),
                  )),
              AdaptivePositioned(
                  left:85,
                  top: 59,
                  child: Container(
                    height: height(17),
                    width: width(134),
                    alignment: Alignment.centerLeft,
                    child: GeneralTextDisplay('2nd of May, 2020', Color.fromRGBO(127, 127, 127, 1.0), 1,
                        11, FontWeight.w600, 'Date on the active page'),
                  )),
              AdaptivePositioned(
                  left:249,
                  top: 15,
                  child: GeneralTextDisplay('Active', Colors.black, 1,
                      16, FontWeight.bold, 'the active page')),
              AdaptivePositioned(
                left: 262,
                top: 11,
                child: GeneralIconButton(
                    Color.fromRGBO(238, 83, 79, 1.0), height(30),
                    Icon(Icons.chat,color:Color.fromRGBO(238, 83, 79, 1.0),),
                    Colors.white70, width(30),
                        (){}),),
              AdaptivePositioned(
                left: 253,
                top: 68,
                child: GeneralTextDisplay(
                    'Chat me', Color.fromRGBO(85, 85, 85, 1.0), 1, 12,
                    FontWeight.w400, 'chat me text in active page'),
              ),
              AdaptivePositioned(
                left: 17,
                top: 120,
                child: GeneralTextDisplay(
                    'Main task list', Colors.black, 1, 16,
                    FontWeight.bold, 'main task list'),

              ),
              AdaptivePositioned(
                left: 33,
                top: 157,
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Colors.black12,width: 1.0)),
                  width: width(319),
                  height: height(102),
                  padding: EdgeInsets.all(height(5)),
                  child: Column(
                    children: <Widget>[
                      GeneralTextDisplay(
                          'oluwanifemi ajoke, heererat, esther,estianobabe, ogunde',
                        Color.fromRGBO(85, 85, 85, 1.0),
                        6, 11,
                          FontWeight.w600, 'task list'),





                    ],
                  ),
                ),

              ),
              AdaptivePositioned(
                left: 35,
                top: 269,
                child: GeneralTextDisplay(
                    'view attachment', Color.fromRGBO(238, 83, 79, 1.0),
                    1, 11,
                    FontWeight.w600, 'attachment'),

              ),
              AdaptivePositioned(
                left: 17,
                top: 306,
                child: GeneralTextDisplay(
                    'BUDGET', Color.fromRGBO(127, 127, 127, 1.0),
                    1, 10,
                    FontWeight.bold, 'budget'),

              ),
              AdaptivePositioned(
                left: 17,
                top: 328,
                child: GeneralTextDisplay(
                    '#3,000', Color.fromRGBO(0, 0, 0, 1.0),
                    1, 20,
                    FontWeight.bold, 'Money'),

              ),
              AdaptivePositioned(
                left: 244,
                top: 306,
                child: GeneralTextDisplay(
                    'DURATION', Color.fromRGBO(127, 127, 127, 1.0),
                    1, 10,
                    FontWeight.bold, 'time'),

              ),
              AdaptivePositioned(
                left: 244,
                top: 328,
                child: GeneralTextDisplay(
                    '4 Weeks', Color.fromRGBO(0, 0, 0, 1.0),
                    1, 18,
                    FontWeight.bold, 'Money'),

              ),
              AdaptivePositioned(
                  left: 159,
                  top: 375,
                  child: GeneralIconButton(
                      Colors.black,
                      10 / 667,
                      Icon(
                      Icons.arrow_drop_up,
                      color: Colors.black,
                      size: 10 / 667,
                    ),
                      Colors.grey,
                      14/667,
                          (){})),
            ],
          ),
        );
    }


    return SafeArea(
        child: IndexedStack(
          index: 0,
          children: <Widget>[
            jobHalfDisplay(),
            jobFullDisplay()
          ],
        ));
  }

  
}
