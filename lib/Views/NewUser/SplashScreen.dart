import 'package:flutter/material.dart';
import 'package:mergeme/ViewModel/WelcomeViewmodel.dart';
import 'package:mergeme/Views/NewUser/wrapper.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<WelcomeViewModel>.withConsumer(

      viewModelBuilder:()=> WelcomeViewModel(),
      builder: (context,model,child)=>
          SplashScreen(
        seconds: 5,
        navigateAfterSeconds: new Wrapper(),
        title: new Text('Merge Me',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ),
        ),
        image: Image.asset('assets/Merge.PNG',fit: BoxFit.contain,),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader:  TextStyle(),
        photoSize: 100.0,
        onClick: ()=>model.wrapper(),
        loaderColor: Color.fromRGBO(217, 0, 27, 1.0),
      ));
  }
}
