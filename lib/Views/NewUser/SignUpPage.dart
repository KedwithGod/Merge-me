import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/Bloc_settings.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:mergeme/ViewModel/DropDownButton.dart';
import 'package:mergeme/ViewModel/SignUpModel.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generalbuttondisplay.dart';
import 'package:mergeme/Views/Uielements/Generaldropdowndisplay.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';
import 'package:mergeme/Views/Uielements/Generaltextfielddisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';
import 'package:mergeme/Views/Uielements/sizedBox.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';

class SignUp extends StatelessWidget {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController mobileNo = TextEditingController();
  final TextEditingController workNo = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController nin = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ResponsiveSize dynamicSize = ResponsiveSize(context);
    return ChangeNotifierProvider(
      create: (context) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(
        builder: (context, model, child) => Scaffold(
            body: SafeArea(
              child: Stack(
          children: <Widget>[
              AdaptivePositioned(
                left: 24,
                top: 28,
                child: GeneralTextDisplay('Create Account', Colors.black, 1, 21,
                    FontWeight.bold, 'Create Account text in Sign page'),
              ),
              AdaptivePositioned(
                left: 24,
                top: 61,
                child: GeneralTextDisplay(
                    'Sign up to get Started',
                    Color.fromRGBO(127, 127, 127, 1.0),
                    1,
                    15,
                    FontWeight.w400,
                    'Sign Up page subtitle'),
              ),
              AdaptivePositioned(
                left: 336,
                top: 32,
                child: Hero(
                  tag: 'Merge me',
                  child: Container(
                    width: dynamicSize.width(30 / 375),
                    height: dynamicSize.height(30 / 667),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/Merge.PNG'),
                            fit: BoxFit.contain)),
                  ),
                ),
              ),
              AdaptivePositioned(
                  left: 15,
                  top: 130,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: dynamicSize.width(14 / 375),
                    ),
                    height: dynamicSize.height(408 / 667),
                    width: dynamicSize.width(344 / 375),
                    decoration: (BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(dynamicSize.height(11 / 667)),
                        border: Border.all(
                            color: Color.fromRGBO(215, 215, 215, 0.5),
                            width: 1.0,
                            style: BorderStyle.solid))),
                    child: StatesBuilder(
                      stateID: 'TradeSelection',
                      blocs: [mainBloc],
                      builder: (_)=>
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              GeneralTextField(
                                  route.SignUpRoute,
                                  TextInputType.text,
                                  fullName,
                                  "Full name",
                                  'Enter your full name',
                                  route.Name,
                                  1,null,false),
                              GeneralTextField(
                                  route.SignUpRoute,
                                  TextInputType.emailAddress,
                                  email,
                                  "Email",
                                  'Enter your email Addres',
                                  route.Email,
                                  1,null,false),
                              GeneralTextField(
                                  route.SignUpRoute,
                                  TextInputType.number,
                                  mobileNo,
                                  "Phone No (Mobile)",
                                  'Enter your mobile number',
                                  route.mobilePhone,
                                  1,null,false),
                              GeneralTextField(
                                  route.SignUpRoute,
                                  TextInputType.number,
                                  workNo,
                                  "Phone No (Work)",
                                  'Enter your Work number',
                                  route.workPhone,
                                  1,null,false),
                              GeneralTextField(
                                  route.SignUpRoute,
                                  TextInputType.visiblePassword,
                                  password,
                                  "Password",
                                  'Enter your password',
                                  route.Password,
                                  1,null,false),
                              GeneralTextField(
                                  route.SignUpRoute,
                                  TextInputType.visiblePassword,
                                  confirmPassword,
                                  "Confirm Password",
                                  'Confirm your password',
                                  route.Password,
                                  1,null,false),
                              GeneralTextField(
                                  route.SignUpRoute,
                                  TextInputType.text,
                                  nin,
                                  "National Identity No",
                                  'Enter your national identity no',
                                  route.NIN,
                                  // TODO: how to verify nin number

                                  1,null,false),
                              AdaptiveSizedBox(height: 10/667,),
                             GeneralDropDownDisplay(
                                  'what will you like to do',
                                  ['',
                                    'Give a work',
                                    'Learn a trade',
                                    'Search for work'
                                  ],
                                  route.trade,
                                  'what will you like to do',
                                  'Trade'),
                              AdaptiveSizedBox(height: 10/667,),
                              GeneralDropDownDisplay(
                                  'Like to be a tutor',
                                  ['',
                                    'Yes',
                                    'No',
                                  ],
                                  route.tutorOption,
                                  'Like to be tutor',
                                  'Tutor'),


                              AdaptiveSizedBox(height: 10/667,),
                              mainBloc.tradeSelection(),
                              AdaptiveSizedBox(height: 10/667,),
                              mainBloc.toggleView==false?mainBloc.onTap():mainBloc.tradeValue(),
                              AdaptiveSizedBox(height: 15/667,),
                            ],
                          ),
                        ),
                      ),


                    ),
                  )),
              AdaptivePositioned(
                  top: 535,
                  left: 30,
                  child: StatesBuilder(
                    stateID: 'Sign in' ,
                    blocs: [mainBloc],
                    builder: (_)=>  GeneralButton('', 1, 'Sign up at Sign up page',
                        'Sign Up', Colors.white, 20, FontWeight.w500, 50, 314, () {
                      model.validateForm(_formKey, {
                        route.Name: fullName.text,
                        route.Email: email.text,
                        route.workPhone: workNo.text,
                        route.mobilePhone: mobileNo.text,
                        route.Password: password.text
                      },email.text,password.text,fullName.text,mobileNo.text,
                          workNo.text,
                          nin.text,
                          mainBloc.tradeName,
                          mainBloc.tradeCategory,
                          mainBloc.tutorOption,
                          mainBloc.specificTradeVal,context);
                    }, 11, 11, 1, 1, Color.fromRGBO(238, 83, 79, 1.0), Colors.white,
                        5.0),
                  )),
              AdaptivePositioned(
                left: 90,
                top: 601,
                child: GeneralTextDisplay(
                    'i am already a member,',
                    Color.fromRGBO(121, 121, 121, 1.0),
                    1,
                    12,
                    FontWeight.w300,
                    'i am already a member text'),
              ),
              AdaptivePositioned(
                left: 260,
                top: 601,
                child: GestureDetector(
                  onTap: () {
                    model.loginPage();
                  },
                  child: GeneralTextDisplay(
                      'Sign In',
                      Color.fromRGBO(220, 42, 53, 0.9),
                      1,
                      12,
                      FontWeight.w500,
                      'Sign IN semantics in login page'),
                ),


              ),

          ],
        ),
            )),
      ),
    );
  }
}


