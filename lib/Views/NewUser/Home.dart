import 'package:flutter/material.dart';
import 'file:///C:/Users/user/Documents/Flutter_projects/merge_me/lib/Views/Uielements/AdaptivePostionedWidget.dart';
import 'file:///C:/Users/user/Documents/Flutter_projects/merge_me/lib/Views/Uielements/Generalbuttondisplay.dart';
import 'file:///C:/Users/user/Documents/Flutter_projects/merge_me/lib/Views/Uielements/Generaltextdisplay.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  onErrorCall() {
    return Image.asset(
      "assets/onError.png",
      fit: BoxFit.contain,
    );
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery
        .of(context)
        .orientation;
    return Scaffold(
      body: Stack(
        children: <Widget>[
        AdaptivePositioned(
        top: 0.0,
        left: 0.0,
        child: Container(
          height: orientation == Orientation.landscape
              ? MediaQuery
              .of(context)
              .size
              : MediaQuery
              .of(context)
              .size
              .height,
          width: orientation == Orientation.landscape
              ? MediaQuery
              .of(context)
              .size
              .height
              : MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.75),
              image: DecorationImage(
                image: AssetImage('assets/Home.jpg'),
                fit: BoxFit.cover,
              )),
        ),
      ),
      AdaptivePositioned(
        top: 0.0,
        left: 0.0,
        child: Container(
          height: orientation == Orientation.landscape
              ? MediaQuery
              .of(context)
              .size
              : MediaQuery
              .of(context)
              .size
              .height,
          width: orientation == Orientation.landscape
              ? MediaQuery
              .of(context)
              .size
              .height
              : MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.75),
          ),
        ),
      ),
      AdaptivePositioned(
        top: 128,
        left: 105.0,
        child: Image.asset(
          'assets/Merge.PNG',
          fit: BoxFit.contain,
        ),
      ),
      AdaptivePositioned(
        top: 289,
        left: 70,
        child: GeneralTextDisplay('Merge me', Color.fromRGBO(217, 0, 23, 1.0),
            1, 40, FontWeight.w900, "marge me homepage semantics"),
      ),
      AdaptivePositioned(
        top: 353,
        left: 14,
        child: GeneralTextDisplay(
            'Get connected to services that meet your need',
            Color.fromRGBO(51, 51, 51, 1.0),
            1,
            13,
            FontWeight.normal,
            "marge me subtitle homepage semantics"),
      ),
      AdaptivePositioned(
        top: 570,
        left: 26,
        child: GeneralButton(
            '',
            1,
            'Login button at homepage',
            'Login',
            Colors.white,
            15,
            FontWeight.w500,
            40,
            140,
                () {},
            5,
            5,
            5,
            5,
            Color.fromRGBO(220, 42, 53, 1.0),
            Colors.white,
            2.0),
      ),
      AdaptivePositioned(
          top: 570,
          left: 170,

          child: GeneralButton(
              'border',
              1,
              'Sign Up button at homepage',
              'Sign Up',
              Color.fromRGBO(220, 42, 53, 1.0),
              15,
              FontWeight.w500,
              40,
              140,
              (){},
              5,
              5,
              5,
              5,
              Colors.transparent,
              Colors.red,
              0.0)



    ),]
    ,
    )
    );
  }
}
