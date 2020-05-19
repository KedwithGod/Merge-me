import 'package:flutter/material.dart';
import 'file:///C:/Users/user/Documents/Flutter_projects/merge_me/lib/Views/Uielements/AdaptivePostionedWidget.dart';
import 'file:///C:/Users/user/Documents/Flutter_projects/merge_me/lib/Views/Uielements/Generalbuttondisplay.dart';
import 'file:///C:/Users/user/Documents/Flutter_projects/merge_me/lib/Views/Uielements/Generaltextdisplay.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            AdaptivePositioned(
              left: 24,
              top: 28,
              child: GeneralTextDisplay(
                  'Welcome', Colors.black, 1, 21,
                  FontWeight.bold, 'Welcome text in login page'),
            ),
            AdaptivePositioned(
              left: 27,
              top: 61,
              child: GeneralTextDisplay(
                  'Sign in to continue', Color.fromRGBO(127, 127, 127, 1.0), 1, 15,
                  FontWeight.w400, 'login page subtitle'),
            ),
            AdaptivePositioned(
              left: 334,
              top: 28,
              child: Container(

              ),
            ),
        AdaptivePositioned(
          top: 100,
          left: 199,

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
        ),
            AdaptivePositioned(
                top: 100,
                left: 50,

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
            )],
        )
    );
  }
}
