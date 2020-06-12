import 'package:flutter/material.dart';
import 'package:mergeme/Views/History/TabBarView.dart';
import 'package:mergeme/Views/History/shared_header.dart';

class MyJobPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children:[
          SharedHeader('My Jobs'),
              Positioned(
                left: 29,
                top: 69,
                right: 0,
                bottom: 0,
                child: Column(
                  children: <Widget>[
                    Tabs(),
                    Expanded(
                      flex: 1,
                        child: TabBarView(
                            children: null))

                  ],
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}
