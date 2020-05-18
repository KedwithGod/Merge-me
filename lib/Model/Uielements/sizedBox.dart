import 'package:flutter/material.dart';

class SizedBoxDisplay extends StatelessWidget {
  final int sizedBoxWidth;
  final int sizedBoxHeight;
  SizedBoxDisplay({this.sizedBoxHeight,this.sizedBoxWidth});
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return SafeArea(
      child: SizedBox(
        height: sizedBoxHeight==null?0.0:orientation == Orientation.portrait
      ? MediaQuery.of(context).size.height * (sizedBoxHeight / 667)
            : MediaQuery.of(context).size.width * (sizedBoxHeight / 375),
    width:  sizedBoxWidth==null?0.0:orientation == Orientation.landscape
    ? MediaQuery.of(context).size.height * (sizedBoxWidth / 667)
        : MediaQuery.of(context).size.width * (sizedBoxWidth / 375),

      ),
    );
  }
}
