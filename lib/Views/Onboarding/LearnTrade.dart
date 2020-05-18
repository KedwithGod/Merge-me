import 'package:flutter/material.dart';
import 'package:mergeme/Views/Onboarding/OnBoardingTemplate.dart';

class LearnTradeOnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:OnBoardingTemplate(
          '''Get access to tutor for any trade you wish to learn.\nAvailable for local trades suchs as cake\nmaking, bead making,tech jobs such as\ndata scientist, software engineers,\nArtisans such as mechanics, Electricans,\nRepairs such as Fan repairers, Television\nrepairs.''',
              (){}, (){},
              (){}, 'assets/learnt trade 2.jpg', 'Learn A Trade', true,false)
    );
  }
}