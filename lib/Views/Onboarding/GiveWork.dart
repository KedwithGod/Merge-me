import 'package:flutter/material.dart';
import 'package:mergeme/Views/Onboarding/OnBoardingTemplate.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;

class GiveWorkOnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OnBoardingTemplate(
            '''Get work from trustworthy clients,\nfill your wallet & fund your bank account.\nAvailable for local trades suchs as cake\nmaking, bead making,tech jobs such as\ndata scientist, software engineers,\nArtisans such as mechanics, Electricans,\nRepairs such as Fan repairers, Television \nrepairs.''',
             route.OnBoardingSearchWork, 'assets/give work out 2.jpg',"Give Out Work", false,true));
  }
}
