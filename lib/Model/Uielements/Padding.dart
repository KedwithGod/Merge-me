import 'package:flutter/material.dart';

class PaddingDisplay extends StatelessWidget {
  final int leftPadding;
  final int rightPadding;
  final int topPadding;
  final int bottomPadding;
  final Widget paddingChild;

  PaddingDisplay({this.bottomPadding, this.leftPadding, this.rightPadding,this.topPadding,this.paddingChild});
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return SafeArea(
        child: Padding(
          child: paddingChild,
            padding: EdgeInsets.only(
                left: leftPadding==null?0.0:orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.height * leftPadding/ 667
                    : MediaQuery.of(context).size.width *leftPadding / 375,
                top: topPadding==null?0.0:orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.height * topPadding/ 667
                    : MediaQuery.of(context).size.width *topPadding / 375,
                right: rightPadding==null?0.0:orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.height * rightPadding/ 667
                    : MediaQuery.of(context).size.width *rightPadding / 375,
                bottom:bottomPadding==null?0.0:orientation == Orientation.portrait
                    ? MediaQuery.of(context).size.height *  bottomPadding/ 667
                    : MediaQuery.of(context).size.width * bottomPadding / 375 )));
  }
}
