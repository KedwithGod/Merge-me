import 'package:flutter/material.dart';
import 'package:mergeme/ViewModel/OnboardingModel.dart';
import 'file:///C:/Users/user/Documents/Flutter_projects/merge_me/lib/Views/Uielements/AdaptivePostionedWidget.dart';
import 'file:///C:/Users/user/Documents/Flutter_projects/merge_me/lib/Views/Uielements/Generalbuttondisplay.dart';
import 'file:///C:/Users/user/Documents/Flutter_projects/merge_me/lib/Views/Uielements/Generaltextdisplay.dart';
import 'package:provider/provider.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;

class OnBoardingTemplate extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String subtitle;
  final bool useBackButton;
  final bool useNextButton;
  final String nextButtonCall;

  OnBoardingTemplate(this.subtitle, this.nextButtonCall,
      this.imageAsset, this.title, this.useBackButton, this.useNextButton);

  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return ChangeNotifierProvider<OnBoardingViewModel>(
        create: (context) => OnBoardingViewModel(),
        child: Consumer<OnBoardingViewModel>(
          builder: (context, model, child) => Scaffold(
            body: SafeArea(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 0.0,
                    top: 0.0,
                    child: AnimatedContainer(
                      height: orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.height * (296 / 667)
                          : MediaQuery.of(context).size.width * (296 / 667),
                      width: orientation == Orientation.landscape
                          ? MediaQuery.of(context).size.height * (375 / 375)
                          : MediaQuery.of(context).size.width * (375 / 375),
                      duration: Duration(seconds: 2),
                      curve: Curves.fastOutSlowIn,
                      child: Image.asset(
                        imageAsset,
                        fit: BoxFit.cover,
                        height: orientation == Orientation.portrait
                            ? MediaQuery.of(context).size.height * (296 / 667)
                            : MediaQuery.of(context).size.width * (296 / 667),
                        width: orientation == Orientation.landscape
                            ? MediaQuery.of(context).size.height * (375 / 375)
                            : MediaQuery.of(context).size.width * (375 / 375),
                      ),
                    ),
                  ),
                  AdaptivePositioned(
                      left: 0.0,
                      top: 295,
                      child: Container(
                        color: Colors.black,
                        height: orientation == Orientation.portrait
                            ? MediaQuery.of(context).size.height * (3 / 667)
                            : MediaQuery.of(context).size.width * (3 / 667),
                        width: orientation == Orientation.landscape
                            ? MediaQuery.of(context).size.height * (375 / 375)
                            : MediaQuery.of(context).size.width * (375 / 375),
                      )),
                  AdaptivePositioned(
                      left: 25.0,
                      top: 327,
                      child: GeneralTextDisplay(title, Colors.black, 1, 25,
                          FontWeight.w900, '$title onBoarding text')),
                  AdaptivePositioned(
                      left: 22.0,
                      top: 377,
                      child: GeneralTextDisplay(
                          subtitle,
                          Color.fromRGBO(85, 85, 85, 1.0),
                          8,
                          14,
                          FontWeight.w200,
                          '$title onBoarding subtitle')),
                  AdaptivePositioned(
                      top: 555,
                      left: 16,
                      child: GeneralButton(
                          "",
                          1,
                          '$title Get started semantics',
                          'Get Started',
                          Colors.white,
                          13,
                          FontWeight.w400,
                          40,
                          140, () {
                        model.getStarted();
                      }, 11, 11, 11, 11, Color.fromRGBO(238, 83, 79, 1.0),
                          Colors.white, 4.0)),
                  useNextButton == false
                      ? Container()
                      : AdaptivePositioned(
                          top: 555,
                          left: 260,
                          child: GeneralButton(
                              "Flat",
                              1,
                              '$title Next button semantics',
                              'Next',
                              Color.fromRGBO(238, 83, 79, 1.0),
                              13,
                              FontWeight.w400,
                              19,
                              32,
                             (){
                                if (nextButtonCall==route.OnBoardingSearchWork){
                                  model.onBoardingSearchWork();
                                }
                                else if (nextButtonCall==route.OnBoardingLearnTrade){
                                  model.onBoardingLearnTrade();
                                }
                                else if (nextButtonCall==route.HomeRoute){
                                  model.getStarted();
                                }
                             },
                              2,
                              2,
                              2,
                              2,
                              Colors.transparent,
                              Colors.white,
                              0.0)),

                  useBackButton == false
                      ? Container()
                      : AdaptivePositioned(
                          top: 555,
                          left: useNextButton == false ? 280 : 190,
                          child: GeneralButton(
                              "",
                              1,
                              '$title Back button se',
                              'Back',
                              useNextButton == false
                                  ? Color.fromRGBO(238, 83, 79, 1.0)
                                  : Color.fromRGBO(127, 127, 127, 1.0),
                              13,
                              FontWeight.w400,
                              19,
                              32,
                              () => model.navigateBack(),
                              2,
                              2,
                              2,
                              2,
                              Colors.transparent,
                              Colors.white,
                              0.0))
                ],
              ),
            ),
          ),
        ));
  }
}

/*
Positioned(
left:32,
top:600,
child: GeneralButton(
'',
1,
'Get started sematics',
'Get Started',
Colors.white,
13,
FontWeight.w400,
40 ,
140,
(){},
11,
11,
11,
11,
Color.fromRGBO(238, 83, 79, 1.0),
Colors.white,
4.0),
)*/
