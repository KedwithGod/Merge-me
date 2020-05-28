import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/Bloc_settings.dart';
import 'package:mergeme/ViewModel/DropDownButton.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generalbuttondisplay.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'Generaltextdisplay.dart';

var searchWidth=0.0;
var giveWidth=1.0;
var giveWidthStart=307.0;
var learnWidth=0.0;

class ResponsiveSize {
  BuildContext context;

  ResponsiveSize(this.context);

  double height(height) {
    return MediaQuery.of(context).size.height * (height);
  }

  double width(width) {
    return MediaQuery.of(context).size.width * (width);
  }
}

BorderRadius adaptiveBorderRadius(context, {double radius}) {
  return BorderRadius.all(
    Radius.circular(
      MediaQuery.of(context).size.height * (radius / 375),
    ),
  );
}

class AdaptiveContainer extends StatelessWidget {
  final double left;
  final double top;
  final double height;
  final double width;
  final String image;
  final String buttonText;
  final Function onButtonPress;

  final double buttonLeft;
  final double buttonTop;

  const AdaptiveContainer(
    this.left,
    this.top,
    this.height,
    this.width,
    this.image,
    this.buttonText,
    this.onButtonPress,
    this.buttonLeft,
    this.buttonTop,
  );

  @override
  Widget build(BuildContext context) {
    return  AdaptivePositioned(
        left: left,
        top: top,
        child: Stack(
          children: <Widget>[
            StatesBuilder(
              stateID: 'swipeDetector' ,
              blocs: [mainBloc],
              builder: (_)=>  SwipeDetector(
                onSwipeRight: () {},
                onSwipeLeft: (){
                },
                child: GestureDetector(
                  onTap: onButtonPress,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 1000),
                    curve:Curves.decelerate,
                    height: ResponsiveSize(context).height(height / 667),
                    width: ResponsiveSize(context).width(width / 375),
                    decoration: BoxDecoration(
                      borderRadius: adaptiveBorderRadius(context, radius: 11),
                      image:
                          DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ),
            AdaptivePositioned(
              left: buttonLeft,
              top: buttonTop,
              child: GeneralButton(
                  'Raised',
                  1,
                  '$buttonText for landing page at $top',
                  buttonText,
                  Colors.white,
                  13,
                  FontWeight.w500,
                  34,
                  140,
                  onButtonPress,
                  11,
                  11,
                  11,
                  11,
                  Color.fromRGBO(220, 42, 53, 1.0),
                  Colors.white,
                  5.0),
            )
          ],
        ),

    );
  }
}

Widget landingPageTile(context, String number, String titleText,
    String subtitleText, bool firstPage,
    {Widget child}) {
  return
     Container(
      height: ResponsiveSize(context).height(252 / 667),
      width: ResponsiveSize(context).width(180 / 375),
      child: Stack(
        children: <Widget>[
          AdaptivePositioned(
            left: 0,
            top: 35,
            child: Container(
              height: ResponsiveSize(context).height(216 / 667),
              width: ResponsiveSize(context).width(180 / 375),
              decoration: BoxDecoration(
                borderRadius: adaptiveBorderRadius(context, radius: 11),
                border: Border.all(
                    width: 1.0,
                    color: Color.fromRGBO(121, 121, 121, 1.0),
                    style: BorderStyle.solid),
              ),
              child: Stack(
                children: <Widget>[
                  AdaptivePositioned(
                    left: 16,
                    top: 39,
                    child: GeneralTextDisplay(titleText, Colors.black, 1, 16,
                        FontWeight.bold, '$titleText'),
                  ),
                  AdaptivePositioned(
                    left: 16,
                    top: 72,
                    child: GeneralTextDisplay(
                        subtitleText,
                        Color.fromRGBO(127, 127, 127, 0.7),
                        6,
                        13,
                        FontWeight.w400,
                        '$titleText text body'),
                  ),
                  child??Container(),
                  firstPage == true
                      ? AdaptivePositioned(
                          left: 16,
                          top: 167,
                          child: Image.asset(
                            'assets/youtube.png',
                            height: ResponsiveSize(context).height(24 / 667),
                            width: ResponsiveSize(context).width(20 / 375),
                          ),
                        )
                      : Container(),
                  firstPage == true
                      ? AdaptivePositioned(
                          left: 48,
                          top: 165,
                          child: GeneralTextDisplay(
                              'https://youtu.be\n/m_aEOZxPWO0',
                              Color.fromRGBO(121, 121, 121, 1.0),
                              3,
                              11,
                              FontWeight.w400,
                              'youtube link of app tutorial'),
                        )
                      : Container()
                ],
              ),
            ),
          ),
          AdaptivePositioned(
            left: 24,
            top: 18,
            child: Container(
              alignment: Alignment.center,
              height: ResponsiveSize(context).height(40 / 667),
              width: ResponsiveSize(context).width(40 / 375),
              decoration: new BoxDecoration(
                color: Color.fromRGBO(238, 83, 80, 1.0),
                shape: BoxShape.circle,
              ),
              child: GeneralTextDisplay(number, Colors.white, 1, 16,
                  FontWeight.w600, '$number tile in landing page'),
            ),
          ),
        ],
      ),
  );
}

Widget index0 (){
  return  Stack(
      children: <Widget>[
        AdaptiveContainer(60, 123, 218, 307, 'assets/LearntradeLp.jpg',
            'Learn a trade', () {mainBloc.indexChange(2);searchWidth=50.0;giveWidth=0.0;learnWidth=307.0;
            print(mainBloc.indexValue);}, 18, 170),
        AdaptiveContainer(41, 109, 246, 307, 'assets/SearchWorkLp.jpg',
            'Search for work', () {mainBloc.indexChange(1);searchWidth=287.0;giveWidth=0.0;
            learnWidth=0.0;
            print(mainBloc.indexValue);searchWidth=287;print(searchWidth);}, 19, 198),
        AdaptiveContainer(24, 90, 292, giveWidth==1.0?giveWidthStart:giveWidth, 'assets/Give workLp.jpg',
            'Give out work', () {mainBloc.indexChange(0);searchWidth=50.0;
              print(mainBloc.indexValue);giveWidth=307.0;
              mainBloc.navigate(route.GiveWork);
          }, 18, 235),
      ],
    );
}

Widget index1(){

  return StatesBuilder(
      stateID: 'index1' ,
      blocs: [mainBloc],
      builder: (_)=>Stack(
      children: <Widget>[
        AdaptiveContainer( 12, 123, 218, 307, 'assets/Give workLp.jpg',
            'Give out work', () {mainBloc.indexChange(0);giveWidth=307.0;
            learnWidth=0.0;
            print(mainBloc.indexValue);
            searchWidth=0.0;},13,175),
        AdaptiveContainer( 60, 109, 246, 307, 'assets/LearntradeLp.jpg',
            'Learn a trade', (){mainBloc.indexChange(2);
            print(mainBloc.indexValue);
            searchWidth=0.0;
            giveWidth=0.0;
            learnWidth=307.0;
            },18,200),
        AdaptiveContainer( 48, 90, 292, searchWidth,
            'assets/SearchWorkLp.jpg',
            'Search for work', () {
              mainBloc.indexChange(1);
              print(mainBloc.indexValue);
              searchWidth=287.0;
              giveWidth=0.0;
              learnWidth=0.0;
              mainBloc.navigate(route.SearchWork);
            },
            28,
            235),
      ],

  ));
}


Widget index2 (){
  return Stack(
      children: <Widget>[
        AdaptiveContainer( 13, 123, 200, 307, 'assets/Give workLp.jpg',
            'Give out work', () {mainBloc.indexChange(0);giveWidth=307.0;learnWidth=0.0;
            searchWidth=00.0;},13,175),
        AdaptiveContainer( 36, 109, 246, 307,
            'assets/SearchWorkLp.jpg', 'Search for work', () {mainBloc.indexChange(1);searchWidth=287.0;giveWidth=0.0;learnWidth=0.0;},19,197),
        AdaptiveContainer( 58, 90, 292, learnWidth, 'assets/LearntradeLp.jpg',
            'Learn a trade', (){mainBloc.indexChange(2);
            print(mainBloc.indexValue);
            searchWidth = 0.0;
            giveWidth = 0.0;
            learnWidth = 307.0;
            mainBloc.navigate(route.LearnTrade);
            },
            18,
            235),
    ],
  );
}