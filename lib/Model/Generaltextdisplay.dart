import 'package:flutter/material.dart';

class GeneralTextDisplay extends StatelessWidget {
  final String inputText;
  final double textFontSize;
  final FontWeight textFontWeight;
  final int noOfTextLine;
  final String textSemanticLabel;
  final Color textColor;

  GeneralTextDisplay(this.inputText,this.textColor, this.noOfTextLine, this.textFontSize,
      this.textFontWeight, this.textSemanticLabel);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return SafeArea(
      child: Text(
        inputText,
        style: TextStyle(
          color: textColor,
          fontSize: orientation == Orientation.portrait
              ? MediaQuery.of(context).size.height *(textFontSize/667)
              : MediaQuery.of(context).size.width * (textFontSize/375),
          fontWeight: textFontWeight,
        ),
        maxLines: noOfTextLine,
        semanticsLabel: textSemanticLabel,
      ),
    );
  }
}
