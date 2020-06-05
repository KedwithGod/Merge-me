import 'package:flutter/material.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:mergeme/ViewModel/LoginModel.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generalbuttondisplay.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Generaltextfielddisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailValue = TextEditingController();
  final TextEditingController passwordValue = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    ResponsiveSize dynamicSize = ResponsiveSize(context);
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => Scaffold(
            body: SafeArea(
              child: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
              AdaptivePositioned(
                left: 24,
                top: 28,
                child: GeneralTextDisplay('Welcome', Colors.black, 1, 23,
                    FontWeight.bold, 'Welcome text in login page'),
              ),
              AdaptivePositioned(
                left: 27,
                top: 61,
                child: GeneralTextDisplay(
                    'Sign in to continue',
                    Color.fromRGBO(127, 127, 127, 1.0),
                    1,
                    17,
                    FontWeight.w400,
                    'login page subtitle'),
              ),
              AdaptivePositioned(
                left: 336,
                top: 32,
                child: Hero(
                  tag: 'Merge me',
                  child: Container(
                    width: dynamicSize.width(30 / 357),
                    height: dynamicSize.height(30 / 667),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Merge.PNG'),
                            fit: BoxFit.contain)),
                  ),
                ),
              ),
              AdaptivePositioned(
                  top: 442,
                  left: 30,
                  child: GeneralButton(
                      '',
                      1,
                      'Login at Login',
                      'Login',
                      Colors.white,
                      20,
                      FontWeight.w500,
                      50,
                      314,
                          (){model.validateForm(
                          _formKey,
                          {
                            route.Name: emailValue.text,
                            route.Password: passwordValue.text,
                            route.isLoggedIn: true
                          },
                          emailValue.text,
                          passwordValue.text,context);},
                      11,
                      11,
                      1,
                      1,
                      Color.fromRGBO(238, 83, 79, 1.0),
                      Colors.white,
                      5.0)),
              Form(
                key: _formKey,
                  child: Stack(
                children: <Widget>[
                  AdaptivePositioned(
                    top: 191,
                    left: 30,
                    child: GeneralTextField(
                        route.LoginRoute,
                        TextInputType.emailAddress,
                        emailValue,
                        'Email',
                        'Enter your email Address',
                        route.Email,
                        2,null,false,dynamicSize.height(64 / 667),dynamicSize.width(314 / 375)),
                  ),
                  AdaptivePositioned(
                    top: 277,
                    left: 30,
                    child: GeneralTextField(
                      route.LoginRoute,
                      TextInputType.visiblePassword,
                      passwordValue,
                      'Password',
                      'Enter your password',
                      route.Password,
                      2,null,false,dynamicSize.height(64 / 667),dynamicSize.width(314 / 375)
                    ),
                  ),
                  AdaptivePositioned(
                    left: 222,
                    top: 350,
                    child: GestureDetector(
                      onTap: (){},
                      child: GeneralTextDisplay(
                          'Forgot Password',
                          Color.fromRGBO(220, 42, 53, 0.5),
                          1,
                          13,
                          FontWeight.w300,
                          'Forgot password semanttc'),
                    ),
                  ),
                  AdaptivePositioned(
                    left: 110,
                    top: 601,
                    child: GeneralTextDisplay(
                        'i am a new user,',
                        Color.fromRGBO(121, 121, 121, 1.0),
                        1,
                        12,
                        FontWeight.w300,
                        'i am a new user text'),
                  ),
                  AdaptivePositioned(
                    left: 225,
                    top: 601,
                    child: GestureDetector(
                      onTap: () {
                        model.signUp();
                      },
                      child: GeneralTextDisplay(
                          'Sign Up',
                          Color.fromRGBO(220, 42, 53, 0.7),
                          1,
                          12,
                          FontWeight.w500,
                          'Sign up semantics in login page'),
                    ),
                  )
                ],
              ))
          ],
        ),
            )),
      ),
    );
  }
}
