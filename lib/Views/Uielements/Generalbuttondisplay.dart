import 'package:flutter/material.dart';
import 'file:///C:/Users/user/Documents/Flutter_projects/merge_me/lib/Views/Uielements/Shared.dart';
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
    ResponsiveSize dynamicSize= ResponsiveSize(context);
    return SafeArea(
      child: ButtonTheme(
        height:  dynamicSize.height(buttonHeight/667),
        minWidth: dynamicSize.width(buttonWidth/375),
        child: RaisedButton(
          padding:EdgeInsets.symmetric(horizontal:2.0),
          splashColor: buttonSplashColor,
          color: buttonColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: buttonToggle=='border'? Color.fromRGBO(220, 42, 53, 1.0):Colors.transparent,
                style: BorderStyle.solid,
                width: 1.0),
            borderRadius: BorderRadius.only(

                topLeft: Radius.circular(dynamicSize.width
                          (topLeftRadius / 375),
                ),
                topRight: Radius.circular(dynamicSize.width
                          (topRightRadius / 375),
                ),
                bottomLeft: Radius.circular(dynamicSize.width
                          (bottomLeftRadius / 375),
                ),
                bottomRight: Radius.circular(dynamicSize.width
                          (bottomRightRadius / 375),
                )),
          ),
          onPressed: onButtonPress,
          elevation: buttonToggle == "Flat" ? 0.0 : buttonElevation,
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
    ResponsiveSize dynamicSize= ResponsiveSize(context);
    return SafeArea(
      child: IconButton(
        color: iconButtonColor,
        onPressed: onIconButtonPress,
        icon: iconButtonIcon,
        iconSize:  dynamicSize.height(iconButtonHeight / 667),
        splashColor: iconButtonSplashColor,
      ),
    );
  }
}
