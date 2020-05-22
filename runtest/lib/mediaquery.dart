import 'package:flutter/material.dart';

class ResponsiveSize {
  BuildContext context;
  ResponsiveSize(this.context);

  double height(height) {
    return MediaQuery.of(context).size.height * (height);
  }
  double width(width){
    return MediaQuery.of(context).size.width * (width);
  }
}
