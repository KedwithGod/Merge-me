import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/Bloc_settings.dart';
import 'package:mergeme/ViewModel/LandingPageViewModel.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResponsiveSize dynamicSize = ResponsiveSize(context);

    return StatesBuilder(
        stateID: 'LandingPage' ,
        blocs: [landingPageBloc],
        builder: (_)=> Scaffold(
        body: Stack(
          children: <Widget>[
            landingPageBloc.changeSlide==null?adaptiveContainer(context, 24, 90, 292, 308, 'assets/Give workLp.jpg',
                'Give out work', () {}): Container(),
            landingPageBloc.changeSlide==null?adaptiveContainer(context, 41, 109, 246, 307,
                'assets.SearchWorkLp.jpg', 'Search for work', () {}): Container(),
            landingPageBloc.changeSlide==null?adaptiveContainer(context, 60, 123, 218, 307, 'assets/LearntradeLp.jpg',
                'Learn a trade', (){}): Container(),

            adaptiveContainer(context, 26, 109, 246, 307,
                'assets.SearchWorkLp.jpg', 'Search for work', () {}),
            adaptiveContainer(context, 39, 90, 292, 307,
                'assets.SearchWorkLp.jpg', 'Search for work', () {}),

            adaptiveContainer(context, 60, 109, 246, 307, 'assets/LearntradeLp.jpg',
                'Learn a trade', (){}),
            adaptiveContainer(context, 38, 90, 292, 307, 'assets/LearntradeLp.jpg',
                'Learn a trade', (){}),

            adaptiveContainer(context, 12, 123, 218, 307, 'assets/Give workLp.jpg',
                'Give out work', () {}),
            adaptiveContainer(context, 24, 109, 246, 307, 'assets/Give workLp.jpg',
                'Give out work', () {}),
          ],
        ),
      ),
    );
  }
}
