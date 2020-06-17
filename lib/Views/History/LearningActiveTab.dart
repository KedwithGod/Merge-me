import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mergeme/ViewModel/LearningPageViewModel.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generalbuttondisplay.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';
import 'package:provider_architecture/_provider_widget.dart';

class LearningActiveTab extends ProviderWidget<LearningPageViewModel> {
  @override
  Widget build(BuildContext context, LearningPageViewModel model) {
    ResponsiveSize dynamicSize =ResponsiveSize(context);
    // custom width
    double width(value) {
      return dynamicSize.width(value / 375);
    }

    // custom height
    double height(value) {
      return dynamicSize.height(value / 667);
    }

    learningHalfDisplay() {
      return Stack(
        children: <Widget>[
          AdaptivePositioned(
            left: 0,
            top: 0,
            child: Container(
              height:height(93),
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
                        child: GeneralTextDisplay('Data Science tutor', Colors.black, 1,
                            12, FontWeight.w400, 'tutor type on learning page'),
                      )),
                  AdaptivePositioned(
                      left:85,
                      top: 62,
                      child: Container(
                        height: height(17),
                        width: width(134),
                        alignment: Alignment.centerLeft,
                        child: GeneralTextDisplay('Monthly payment', Color.fromRGBO(127, 127, 127, 1.0), 1,
                            11, FontWeight.w600, 'monthly payment on learning page'),
                      )),

                  AdaptivePositioned(
                      left:223,
                      top: 62,
                      child: Container(
                        height: height(17),
                        width: width(90),
                        alignment: Alignment.centerLeft,
                        child: GeneralTextDisplay('#3,000.00', Colors.black, 1,
                            14, FontWeight.w900, 'money on the active page'),
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

    learningFullDisplay() {
      return Container(
        height:height(332),
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
                      14, FontWeight.w600, 'Name on the  learningActive  page'),
                )),
            AdaptivePositioned(
                left:85,
                top: 38,
                child: Container(
                  height: height(17),
                  width: width(134),
                  alignment: Alignment.centerLeft,
                  child: GeneralTextDisplay('Data Science tutor', Color.fromRGBO(127, 127, 127, 1.0), 1,
                      12, FontWeight.w400, 'trade type in the learningActive page'),
                )),
            AdaptivePositioned(
                left:85,
                top: 62,
                child: Container(
                  height: height(17),
                  width: width(134),
                  alignment: Alignment.centerLeft,
                  child: GeneralTextDisplay('Monthly payment', Color.fromRGBO(127, 127, 127, 1.0), 1,
                      12, FontWeight.w400, 'Monthly payment on learningActive  page'),
                )),
            AdaptivePositioned(
                left:221,
                top: 62,
                child: GeneralTextDisplay('#3000.00', Colors.black, 1,
                    14, FontWeight.bold, 'the learningActive  page')),
            AdaptivePositioned(
                left:84,
                top: 85,
                child: GeneralTextDisplay(' Started:', Colors.black, 1,
                    12, FontWeight.w400, 'the learningActive  page')),
            AdaptivePositioned(
                left:150,
                top: 85,
                child: GeneralTextDisplay(
                    '2nd February, 2020', Colors.black, 1,
                    12, FontWeight.bold, 'the learningActive  page')),

            AdaptivePositioned(
                left:17,
                top: 120,
                child: GeneralTextDisplay(
                    'Payment History', Colors.black, 1,
                    16, FontWeight.w700, 'Payment history on the  learningActive  page')),

            AdaptivePositioned(
                left:200,
                top: 257,
                child: Container(
                  height: 10,
                  width: 20,
                  alignment: Alignment.center,
                  child: Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(color: Colors.red,shape: BoxShape.circle),
                  ),
                )),

            AdaptivePositioned(
                left:15,
                top: 157,
                child: Container(
                  height: height(18),
                  width: width(345),
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[GeneralTextDisplay(
                        '.', Color.fromRGBO(85, 85, 85, 1.0), 1,
                        13, FontWeight.bold, 'full stop 2 the learningActive  page'),
                      GeneralTextDisplay(
                          '2nd March, 2020', Color.fromRGBO(85, 85, 85, 1.0), 1,
                          13, FontWeight.bold, 'history date the learningActive  page'),
                    ],
                  ),
                )),
            AdaptivePositioned(
                left:15,
                top: 185,
                child: Container(
                  height: height(18),
                  width: width(345),
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[GeneralTextDisplay(
                        '.', Color.fromRGBO(85, 85, 85, 1.0), 1,
                        13, FontWeight.bold, 'full stop 2 the learningActive  page'),
                      GeneralTextDisplay(
                          '2nd April, 2020', Color.fromRGBO(85, 85, 85, 1.0), 1,
                          13, FontWeight.bold, 'history date the learningActive  page'),
                    ],
                  ),
                )),
            AdaptivePositioned(
              left: 24,
              top: 216,
              child: GeneralIconButton(
                  Color.fromRGBO(238, 83, 79, 1.0), height(20),
                  Icon(Icons.chat,color:Color.fromRGBO(238, 83, 79, 1.0),),
                  Colors.white70, height(20),
                      (){}),),
            AdaptivePositioned(
              left: 15,
              top: 246,
              child: GeneralTextDisplay(
                  'Chat Kareem Ayomide', Color.fromRGBO(85, 85, 85, 1.0), 1, 12,
                  FontWeight.w400, 'chat user text in learning active page'),
            ),


            AdaptivePositioned(
            left: 15,
              top: 275,
              child: GeneralButton(
                  'Raised',
                  1,
                  'terminate learning',
                 'Terminate Learning',
                  Colors.white,
                  13,
                  FontWeight.w600,
                  34,
                  170,
                  (){model.terminateLearning();},
                  5,
                  5,
                  5,
                  5,
                  Color.fromRGBO(217, 0, 27,1.0),
                  Color.fromRGBO(217, 72, 27,1.0),
                  5.0),
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
            learningHalfDisplay(),
            learningFullDisplay()
          ],
        ));
  }

}
