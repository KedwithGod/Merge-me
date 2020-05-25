import 'package:flutter/material.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResponsiveSize dynamicSize = ResponsiveSize(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          adaptiveContainer(context,26, 109, 246, 307, 'assets.SearchWorkLp.jpg',
              'Search for work', () {}),
          adaptiveContainer(context,
              24, 90, 292, 308, 'assets/Give workLp.jpg','Give out work', (){})
        ],
      ),
    );
  }
}
