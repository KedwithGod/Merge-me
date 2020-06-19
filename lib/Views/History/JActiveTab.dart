import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mergeme/ViewModel/JobPageViewModel.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generalbuttondisplay.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';
import 'package:provider_architecture/_provider_widget.dart';

class ActiveTab extends ProviderWidget<JobPageViewModel> {
  final String pageStatus;

  ActiveTab(this.pageStatus);

  @override
  Widget build(BuildContext context,JobPageViewModel model) {
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
              borderRadius: adaptiveBorderRadius(context,radius: 11),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.35),
                        offset:Offset (0,0),
                        blurRadius: 5
                    )
                  ]),
              child: Stack(
                children: <Widget>[
                  AdaptivePositioned(
                    left: 15,
                    top: 17,
                    child: Container(
                      width: width(60),
                      height: height(46),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(11)),
                          image: DecorationImage(
                              image: AssetImage('assets/office.jpg'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  AdaptivePositioned(
                    left:85,
                    top: 13,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: height(19),
                        width: width(150),
                        child: GeneralTextDisplay(pageStatus=='active'?'Kareem Ayomide':'Kim tasha', Colors.black, 1,
                            14, FontWeight.w600, 'Name on the active page'),
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
                      left:255,
                      top: 12,
                      child: GeneralTextDisplay('Active', Colors.black, 1,
                          16, FontWeight.bold, 'the active page')),
                  AdaptivePositioned(
                      left:249,
                      top: 42,
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
            left: 160,
            top: 78,
              child: GeneralIconButton(
                  Colors.black,
                  10 / 667,
                  Transform.rotate(
                    angle:
                        pi ,
                    child: Icon(
                      Icons.navigation, color: Colors.black,size: height(20),
                    ),
                  ),
                  Colors.grey,
                  14/667,
                  (){model.onTapIndex();}))
        ],
      );
    }

    jobFullDisplay() {
        return Container(
          height:height(388),
          width: width(346),
          decoration: BoxDecoration(color: Colors.white,
              borderRadius: adaptiveBorderRadius(context,radius: 11),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.35),
                    offset:Offset (0,0),
                    blurRadius: 5
                )
              ]),
          child: Stack(
            children: <Widget>[
              AdaptivePositioned(
                left: 15,
                top: 17,
                child: Container(
                  width: width(60),
                  height: height(46),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(11)),
                      image: DecorationImage(
                          image: AssetImage('assets/office.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
              AdaptivePositioned(
                  left:85,
                  top: 13,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: height(19),
                    width: width(150),
                    child: GeneralTextDisplay('Kareem Ayomide', Colors.black, 1,
                        14, FontWeight.w600, 'Name on the active page'),
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
                  left:255,
                  top: 12,
                  child: GeneralTextDisplay('Active', Colors.black, 1,
                      16, FontWeight.bold, 'the active page')),
              AdaptivePositioned(
                left: 253,
                top: 41,
                child: GeneralIconButton(
                    Color.fromRGBO(238, 83, 79, 1.0), height(20),
                    Icon(Icons.chat,color:Color.fromRGBO(238, 83, 79, 1.0),),
                    Colors.white70, height(20),
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
                left: 17,
                top: 157,
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Color.fromRGBO(0, 0, 0, 0.05),width: 1.0)),
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
                left: 220,
                top: 306,
                child: GeneralTextDisplay(
                    'DURATION', Color.fromRGBO(127, 127, 127, 1.0),
                    1, 10,
                    FontWeight.bold, 'time'),

              ),
              AdaptivePositioned(
                left: 220,
                top: 328,
                child: GeneralTextDisplay(
                    '4 Weeks', Color.fromRGBO(0, 0, 0, 1.0),
                    1, 18,
                    FontWeight.bold, 'Money'),

              ),
              AdaptivePositioned(
                  left: 159,
                  top: 360,
                  child: GeneralIconButton(
                      Colors.black,
                      height(20),
                      Icon(
                        Icons.navigation, color: Colors.black,size: height(20),
                      ),
                      Colors.grey,
                      height(20),
                          (){
                        model.onTapIndex();
                          })),
            ],
          ),
        );
    }


    return SafeArea(
        child: IndexedStack(
          index: model.indexValue,
          children: <Widget>[
            jobHalfDisplay(),
            jobFullDisplay()
          ],
        ));
  }

  
}
