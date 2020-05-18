import 'package:flutter/material.dart';

class GeneralIconDisplay extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final Key iconKey;

  GeneralIconDisplay(this.icon, this.iconColor, this.iconKey, this.iconSize);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return SafeArea(
        child: Icon(
      icon,
      key: iconKey,
      size: orientation == Orientation.portrait
          ? MediaQuery.of(context).size.height * iconSize
          : MediaQuery.of(context).size.width * iconSize,
      color: iconColor,
    ));
  }
}
