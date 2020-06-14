import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResponsiveSize dynamicSize =ResponsiveSize(context);
    // custom width
    double width(value) {
      return dynamicSize.width(value / 375);
    }

    // custom height
    double height(value) {
      return dynamicSize.height(value / 667);
    }

    return TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Color.fromRGBO(238, 83, 79, 1.0),
        unselectedLabelColor: Colors.white,
        indicator: new BubbleTabIndicator(
          indicatorHeight: height(31),
          indicatorColor: Colors.white,
          tabBarIndicatorSize: TabBarIndicatorSize.tab,
        ),
        tabs:[
          Container(

            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Tab(text: 'Active',)),
            width: dynamicSize.width(40/360),
          ),
          Container(

            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Tab(text: 'Completed',)),
            width: dynamicSize.width(87/360),
          ),
          Container(

            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Tab(text: 'Closed',)),
            width: dynamicSize.width(40/360),
          ),

        ],
    );
  }
}
