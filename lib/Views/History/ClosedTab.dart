import 'package:flutter/material.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';

class ClosedTab extends StatelessWidget {
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
      child: Container(
        height: height(101),
        width: width(346),
        decoration: BoxDecoration(
          borderRadius: adaptiveBorderRadius(context,radius: 11),
          color: Colors.white,boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.35),
              offset:Offset (0,0),
              blurRadius: 5
          )
        ]
        ),
        child: Stack(
          children: <Widget>[
            AdaptivePositioned(
              left: 15,
              top: 13,
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
                top: 10,
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: height(19),
                  width: width(150),
                  child: GeneralTextDisplay('Kareem Ayomide', Colors.black, 1,
                      14, FontWeight.w600, 'Name on the closed page'),
                )),
            AdaptivePositioned(
                left:85,
                top: 32,
                child: Container(
                  height: height(17),
                  width: width(134),
                  alignment: Alignment.centerLeft,
                  child: GeneralTextDisplay('Data Science', Colors.black, 1,
                      12, FontWeight.w400, 'trade type in the closed page'),
                )),
            AdaptivePositioned(
                left:234,
                top: 10,
                child: Container(
                  height: height(21),
                  width: width(73),
                  alignment: Alignment.centerLeft,
                  child: GeneralTextDisplay('Closed', Colors.black, 1,
                      12, FontWeight.w400, 'Closed in the closed page'),
                )),
            AdaptivePositioned(
                left:77,
                top: 55,
                child: Container(
                  height: height(21),
                  width: width(73),
                  alignment: Alignment.centerLeft,
                  child: GeneralTextDisplay('Paid #3000.00', Colors.black, 1,
                      12, FontWeight.w400, 'Amount in the closed page'),
                )),
          ],
        ),
      )
    );
  }
}
