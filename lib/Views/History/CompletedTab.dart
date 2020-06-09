import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';

class CompletedTab extends StatelessWidget {
  final Widget optionalChild;

  const CompletedTab(this.optionalChild);

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

    return  Container(
      height:height(118),
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
              top: 17,
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
              left:227,
              top: 15,
              child: GeneralTextDisplay('Completed', Colors.black, 1,
                  16, FontWeight.bold, 'the active page')),
          AdaptivePositioned(
              left:218,
              top: 42,
              child: Container(
                height: height(45),
                width: width(127),
                alignment: Alignment.centerLeft,
                child: GeneralTextDisplay('pending payment\n#3,000.00', Colors.black, 2,
                    13, FontWeight.w400, 'money on the active page'),
              )),
          AdaptivePositioned(
            left: 25,
            top: 86,
            child: GeneralTextDisplay('Rate Performance', Color.fromRGBO(127, 127, 127, 1.0)  ,1,
                14, FontWeight.w600, 'Rate me button in completed tab'),
          ),
          AdaptivePositioned(
            left:167 ,
            top: 84,
            child: Container(),
          ),
          AdaptivePositioned(
            left: 191,
            top: 83,
            child: Container(
              height: height(27),
              width: width(37),
              decoration: BoxDecoration(color: Color.fromRGBO(242, 242, 242, 1.0),
              borderRadius:BorderRadius.only(topRight: Radius.circular(width(11)),
              bottomRight:Radius.circular(width(11))) ),
              child: GeneralTextDisplay(
                  '1.0', Color.fromRGBO(51, 51, 51, 1.0), 1, 13,
                  FontWeight.w600, 'Rate reading'),
            ),
          )
        ],
      ),
    );
  }
}
