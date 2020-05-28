import 'package:flutter/material.dart';
import 'package:mergeme/Views/Uielements/AdaptivePostionedWidget.dart';
import 'package:mergeme/Views/Uielements/Generalicondisplay.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';

class JobTemplate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResponsiveSize dynamicSize = ResponsiveSize(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            AdaptivePositioned(
              left: 0,
              top: 0,
              child: Container(
                width: dynamicSize.width( 375/ 375),
                height: dynamicSize.height(134 / 667), 
                decoration: BoxDecoration(color: Color.fromRGBO(238, 83, 79, 1.0)),
                child:Stack(
                  children: <Widget>[
                    AdaptivePositioned(
                      left: 14,
                      top: 24,
                      child:GeneralIconDisplay(Icons.menu, Colors.white, Key('drawer_icon on trade page'), 26/375),
                    ),
                    AdaptivePositioned(
                      left: 80,
                        top: 9,

                    )
                  ],
                )

              ),
            )

          ],
        ),
      ),
    );
  }
}
