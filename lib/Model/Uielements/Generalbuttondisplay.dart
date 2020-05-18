import 'package:flutter/material.dart';
import 'Generaltextdisplay.dart';


class GeneralButton extends StatelessWidget {
  final double buttonHeight;
  final double buttonWidth;
  final String buttonText;
  final Color buttonTextColor;
  final int noOfTextLine;
  final double buttonTextFontSize;
  final FontWeight buttonTextFontWeight;
  final String buttonSemanticLabel;
  final Function onButtonPress;
  final double bottomRightRadius;
  final double bottomLeftRadius;
  final double topLeftRadius;
  final double topRightRadius;
  final Color buttonSplashColor;
  final Color buttonColor;
  final double buttonElevation;
  final String buttonToggle;

  GeneralButton(
      this.buttonToggle,
      this.noOfTextLine,
      this.buttonSemanticLabel,
      this.buttonText,
      this.buttonTextColor,
      this.buttonTextFontSize,
      this.buttonTextFontWeight,
      this.buttonHeight,
      this.buttonWidth,
      this.onButtonPress,
      this.bottomLeftRadius,
      this.bottomRightRadius,
      this.topLeftRadius,
      this.topRightRadius,
      this.buttonColor,
      this.buttonSplashColor,
      this.buttonElevation);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return SafeArea(
      child: ButtonTheme(
        height: orientation == Orientation.portrait
            ? MediaQuery.of(context).size.height * (buttonHeight / 667)
            : MediaQuery.of(context).size.width * (buttonWidth / 375),
        minWidth: orientation == Orientation.landscape
            ? MediaQuery.of(context).size.height * (buttonHeight / 667)
            : MediaQuery.of(context).size.width * (buttonWidth / 375),
        child: RaisedButton(
          splashColor: buttonSplashColor,
          color: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  orientation == Orientation.landscape
                      ? MediaQuery.of(context).size.height *
                          (topLeftRadius / 667)
                      : MediaQuery.of(context).size.width *
                          (topLeftRadius / 375),
                ),
                topRight: Radius.circular(
                  orientation == Orientation.landscape
                      ? MediaQuery.of(context).size.height *
                          (topRightRadius / 667)
                      : MediaQuery.of(context).size.width *
                          (topRightRadius / 375),
                ),
                bottomLeft: Radius.circular(
                  orientation == Orientation.landscape
                      ? MediaQuery.of(context).size.height *
                          (bottomLeftRadius / 667)
                      : MediaQuery.of(context).size.width *
                          (bottomLeftRadius / 375),
                ),
                bottomRight: Radius.circular(
                  orientation == Orientation.landscape
                      ? MediaQuery.of(context).size.height *
                          (bottomRightRadius / 667)
                      : MediaQuery.of(context).size.width *
                          (bottomRightRadius / 375),
                )),
          ),
          onPressed: onButtonPress,
          elevation: buttonToggle == "Flat" ? 0.0 : buttonElevation,
          padding: EdgeInsets.all(2),
          child: GeneralTextDisplay(buttonText, buttonTextColor, noOfTextLine,
              buttonTextFontSize, buttonTextFontWeight, buttonSemanticLabel),
        ),
      ),
    );
  }
}

class GeneralIconButton extends StatelessWidget {
  final Color iconButtonColor;
  final Function onIconButtonPress;
  final Widget iconButtonIcon;
  final double iconButtonHeight;
  final double iconButtonWidth;
  final Color iconButtonSplashColor;

  GeneralIconButton(
      this.iconButtonColor,
      this.iconButtonHeight,
      this.iconButtonIcon,
      this.iconButtonSplashColor,
      this.iconButtonWidth,
      this.onIconButtonPress);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return SafeArea(
      child: IconButton(
        color: iconButtonColor,
        onPressed: onIconButtonPress,
        icon: iconButtonIcon,
        iconSize: orientation == Orientation.portrait
            ? MediaQuery.of(context).size.height * (iconButtonHeight / 667)
            : MediaQuery.of(context).size.width * (iconButtonWidth / 375),
        splashColor: iconButtonSplashColor,
      ),
    );
  }
}
