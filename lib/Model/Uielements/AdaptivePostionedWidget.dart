import 'package:flutter/material.dart';

class AdaptivePositioned extends StatelessWidget {
  final double top;
  final double right;
  final double left;
  final double bottom;
  final Widget positionedChild;
  AdaptivePositioned({this.bottom=0.0,this.left=0.0,this.positionedChild,this.right=0.0,this.top=0.0});
  @override
  Widget build(BuildContext context) {
    return Positioned(top:top,
        left:left,
        right:right,
        bottom:bottom,child: positionedChild);
  }
}
