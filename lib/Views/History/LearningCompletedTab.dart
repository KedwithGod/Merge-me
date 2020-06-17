import 'package:flutter/material.dart';
import 'package:mergeme/ViewModel/LearningPageViewModel.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';
import 'package:provider_architecture/_provider_widget.dart';

class LearningCompletedTab extends ProviderWidget<LearningPageViewModel> {
  @override
  Widget build(BuildContext context, LearningPageViewModel model) {
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
        height: height(142),
        width: width(346),
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
                left: 85,
                top: 13,
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: height(19),
                  width: width(150),
                  child: GeneralTextDisplay(
                      'Kareem Ayomide',
                      Colors.black,
                      1,
                      16,
                      FontWeight.w600,
                      'Name on the learning Complete page'),
                )),
            AdaptivePositioned(
                left: 85,
                top: 38,
                child: Container(
                  height: height(17),
                  width: width(134),
                  alignment: Alignment.centerLeft,
                  child: GeneralTextDisplay(
                      'Data Science tutor',
                      Colors.black,
                      1,
                      12,
                      FontWeight.w400,
                      'tutor type on learning Completed page'),
                )),
            AdaptivePositioned(
                left: 85,
                top: 62,
                child: Container(
                  height: height(17),
                  width: width(134),
                  alignment: Alignment.centerLeft,
                  child: GeneralTextDisplay(
                      'Monthly payment',
                      Colors.black,
                      1,
                      13,
                      FontWeight.w400,
                      'monthly payment on learningCompleted page'),
                )),
            AdaptivePositioned(
                left: 223,
                top: 62,
                child: Container(
                  height: height(17),
                  width: width(134),
                  alignment: Alignment.centerLeft,
                  child: GeneralTextDisplay(
                      '#3000.00',
                      Color.fromRGBO(85, 85, 85, 1.0),
                      1,
                      14,
                      FontWeight.w400,
                      'Amount payed in learningCompleted page'),
                )),
            AdaptivePositioned(
                left: 87,
                top: 85,
                child: Container(
                  height: height(17),
                  width: width(134),
                  alignment: Alignment.centerLeft,
                  child: GeneralTextDisplay(
                      'Month Started',
                      Color.fromRGBO(127, 127, 127, 1.0),
                      1,
                      13,
                      FontWeight.w400,
                      'monthly payment on learningCompleted page'),
                )),
            AdaptivePositioned(
                left: 223,
                top: 86,
                child: Container(
                  height: height(17),
                  width: width(134),
                  alignment: Alignment.centerLeft,
                  child: GeneralTextDisplay(
                      '2nd February, 2020',
                      Colors.black,
                      1,
                      12,
                      FontWeight.bold,
                      'Date of Commencement in learningCompleted page'),
                )),
            AdaptivePositioned(
                left: 110,
                top: 85,
                child: Container(
                  height: height(17),
                  width: width(134),
                  alignment: Alignment.centerLeft,
                  child: GeneralTextDisplay(
                      'Month Spent',
                      Colors.black,
                      1,
                      13,
                      FontWeight.w400,
                      'month spent on learningCompleted page'),
                )),
            AdaptivePositioned(
                left: 223,
                top: 110,
                child: Container(
                  height: height(17),
                  width: width(134),
                  alignment: Alignment.centerLeft,
                  child: GeneralTextDisplay(
                      '6 Months',
                      Colors.black,
                      1,
                      12,
                      FontWeight.bold,
                      'Duration in learningCompleted page'),
                )),
            AdaptivePositioned(
                left: 85,
                top: 109,
                child: Container(
                  height: height(17),
                  width: width(134),
                  alignment: Alignment.centerLeft,
                  child: GeneralTextDisplay(
                      'All fees for the 6 month has been paid',
                      Colors.black,
                      1,
                      13,
                      FontWeight.w600,
                      'Duration in learningCompleted page'),
                )),
          ],
        ),
      ),
    );
  }
}
