import 'package:flutter/material.dart';
import 'package:mergeme/Views/Work/workTemplate_page.dart';

class LearnTrade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WorkTemplate('Learn a Trade', 'tutor', 0)),
    );
  }
}
