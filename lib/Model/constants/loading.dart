import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitChasingDots(
          color: Color.fromRGBO(238, 83, 79, 1.0),
          size: 50.0,
          duration: Duration(seconds:3),
        ),
      ),
    );
  }
}