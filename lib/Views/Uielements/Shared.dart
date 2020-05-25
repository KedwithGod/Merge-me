import 'package:flutter/material.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generalbuttondisplay.dart';

class ResponsiveSize {
  BuildContext context;

  ResponsiveSize(this.context);

  double height(height) {
    return MediaQuery.of(context).size.height * (height);
  }

  double width(width) {
    return MediaQuery.of(context).size.width * (width);
  }
}

BorderRadius adaptiveBorderRadius(context, {double radius}) {
  return BorderRadius.all(
    Radius.circular(
      MediaQuery.of(context).size.width * (radius / 375),
    ),
  );
}

Widget adaptiveContainer(context,
    left,
    top,
    height,
    width,
    String image,
    buttonText,
    onButtonPress,
    ) {
  return AdaptivePositioned(
    left: 26,
    top: 109,
    child: Stack(
      children: <Widget>[
        Container(
          height: ResponsiveSize(context).height(height / 667),
          width: ResponsiveSize(context).width(width / 375),
          decoration: BoxDecoration(
            borderRadius: adaptiveBorderRadius(context, radius: 11),
            image: DecorationImage(
                image: AssetImage('assets.Search work.jpg'),
                fit: BoxFit.contain),
          ),
        ),
        GeneralButton(
            'Raised',
            1,
            '$buttonText for landing page at $top',
            buttonText,
            Colors.white,
            13,
            FontWeight.w500,
            34,
            140,
            onButtonPress,
            11,
            11,
            11,
            11,
            Color.fromRGBO(220, 42, 53, 1.0),
            Colors.white,
            5.0)
      ],
    ),
  );
}