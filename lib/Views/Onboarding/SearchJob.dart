import 'package:flutter/material.dart';
import 'package:mergeme/Views/Onboarding/OnBoardingTemplate.dart';

class SearchWorkOnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: OnBoardingTemplate(
        '''Get work from trustworthy clients,\nfill your wallet & fund your bank account.\nAvailable for local trades suchs as cake\nmaking, bead making,tech jobs such as\ndata scientist, software engineers,\nArtisans such as mechanics, Electricans,\nRepairs such as Fan repairers, Television\nrepairs.''',
                (){}, (){},
                (){}, 'assets/Search work.jpg', 'Search For Work', true,true));
  }
}
