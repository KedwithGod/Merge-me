import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mergeme/ViewModel/JobPageViewModel.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';
import 'package:provider_architecture/_provider_widget.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CompletedTab extends ProviderWidget<JobPageViewModel> {
  final String pageStatus;

   CompletedTab(this.pageStatus);

  @override
  Widget build(BuildContext context, JobPageViewModel model) {
    ResponsiveSize dynamicSize =ResponsiveSize(context);
    // custom width
    double width(value) {
      return dynamicSize.width(value / 375);
    }

    // custom height
    double height(value) {
      return dynamicSize.height(value / 667);
    }

    return  Stack(
      children: <Widget>[
        AdaptivePositioned(
          left: 0,
          top: 0,
          child: Container(
            height:pageStatus=='active'?height(200):height(130),
            width: width(350),
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
                  left: 10,
                  top: 17,
                  child: Container(
                    width: width(60),
                    height: height(46),
                    decoration: BoxDecoration(
                        borderRadius: adaptiveBorderRadius(context,radius: 11),
                        image: DecorationImage(
                            image: AssetImage('assets/office.jpg'),
                            fit: BoxFit.cover)),
                  ),
                ),
                AdaptivePositioned(
                    left:80,
                    top: 17,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: height(19),
                      width: width(250),
                      child: GeneralTextDisplay('Kareem Ayomide', Colors.black, 1,
                          14, FontWeight.w600, 'Name on the active page'),
                    )),
                AdaptivePositioned(
                    left:80,
                    top: 38,
                    child: Container(
                      height: height(17),
                      width: width(134),
                      alignment: Alignment.centerLeft,
                      child: GeneralTextDisplay('Data Science', Colors.black, 1,
                          12, FontWeight.w400, 'trade type in the active page'),
                    )),
                AdaptivePositioned(
                    left:80,
                    top: 59,
                    child: Container(
                      height: height(17),
                      width: width(134),
                      alignment: Alignment.centerLeft,
                      child: GeneralTextDisplay('2nd of May, 2020', Color.fromRGBO(127, 127, 127, 1.0), 1,
                          11, FontWeight.w600, 'Date on the active page'),
                    )),
                AdaptivePositioned(
                    left:80,
                    top: 90,
                    child: GeneralTextDisplay('Completed', Colors.black, 1,
                        16, FontWeight.bold, 'the active page')),
                AdaptivePositioned(
                    left:80,
                    top: 113,
                    child: GeneralTextDisplay('pending payment ', Colors.blueGrey, 2,
                        13, FontWeight.w400, 'money on the active page')),
                AdaptivePositioned(
                    left:220,
                    top: 113,
                    child: GeneralTextDisplay('#3000', Colors.black, 2,
                        14, FontWeight.bold, 'money on the active page')),
                AdaptivePositioned(
                  left: 80,
                  top: 144,
                  child: GeneralTextDisplay(
                      'Rate Performance',
                      Color.fromRGBO(127, 127, 127, 1.0),
                      1,
                      12,
                      FontWeight.w600,
                      'Rate me button in completed tab'),
                ),
                pageStatus=='active'?AdaptivePositioned(
                  left:80 ,
                  top: 162,
                  child: Container(
                    width: width(126),
                    height: height(24),
                    alignment: Alignment.centerLeft,
                    child: SmoothStarRating(
                      rating: model.rating?? 0,
                      isReadOnly: false,
                      size: height(18),
                      filledIconData: Icons.star,
                      halfFilledIconData: Icons.star_half,
                      defaultIconData: Icons.star_border,
                      color: Color.fromRGBO(238, 83, 79, 1.0),
                      borderColor: Color.fromRGBO(238, 83, 79, 1.0) ,
                      starCount: 5,
                      allowHalfRating: true,
                      spacing: 2.0,
                      onRated: (value) {model.updateRating(value);
                        print("rating value -> $value");
                        // print("rating value dd -> ${value.truncate()}");
                      },
                    ),
                  ),
                ):Container(),
                pageStatus=='active'?AdaptivePositioned(
                  left: 210,
                  top: 162,
                  child: Container(
                    height: height(24),
                    width: width(37),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.white,
                    borderRadius:BorderRadius.only(topRight: Radius.circular(width(11)),
                    bottomRight:Radius.circular(width(11))) ),
                    child: GeneralTextDisplay(
                        '${model.rating}', Color.fromRGBO(51, 51, 51, 1.0), 1, 13,
                        FontWeight.w600, 'Rate reading'),
                  ),
                ):Container()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
