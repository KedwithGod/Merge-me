import 'package:flutter/material.dart';
import 'package:mergeme/Views/History/shared_header.dart';

class MyJobPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children:[
        SharedHeader('My Jobs'),
            
          ]
        ),
      ),
    );
  }
}
