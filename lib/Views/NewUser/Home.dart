import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
   onErrorCall(){
     return Image.asset("assets/onError.png", fit: BoxFit.contain,);
   }
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Positioned(
          top: 0.0,
          left: 0.0,
          child: Container(
            height: orientation == Orientation.landscape
                ? MediaQuery.of(context).size
                : MediaQuery.of(context).size.height,
            width: orientation == Orientation.landscape
                ? MediaQuery.of(context).size.height
                : MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.75),
                image: DecorationImage(
                  image: AssetImage('assets/Home.jpg'),
                  fit: BoxFit.contain,
                )),
          ),
        ),
        Positioned(top: 128,
        left: 80.0,
        child: Image.asset(name),)
      ],
    ));
  }
}
