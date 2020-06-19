import 'package:flutter/material.dart';

import 'Shared.dart';

class AdaptiveSizedBox extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;

  const AdaptiveSizedBox({Key key, this.height=0.0, this.width=0.0, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResponsiveSize dynamicSize = ResponsiveSize(context);
    return SafeArea(
      child: SizedBox(
          height: dynamicSize.height(height),
          width: dynamicSize.width(width),
          child: child),
    );
  }
}
