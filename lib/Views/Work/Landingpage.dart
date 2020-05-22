import 'package:flutter/material.dart';
import 'package:mergeme/Views/Uielements/Generaldropdowndisplay.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Column(
          children: <Widget>[
            Container(height: 200,),
            GeneralDropDownDisplay('Select trade category',
                ['',
                  'Local Trade',
                  'Tech Jobs',
                  'Artisans',
                  'Repairs'
                ],
               'tradeCategory',
                'Choose a Trade',
                'Trade Category'),
          ],
        ),

    );

  }
}
