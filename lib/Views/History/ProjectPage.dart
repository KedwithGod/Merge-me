import 'package:flutter/material.dart';
import 'package:mergeme/ViewModel/JobPageViewModel.dart';
import 'package:mergeme/ViewModel/ProjectViewModel.dart';
import 'package:mergeme/Views/History/JActiveTab.dart';
import 'package:mergeme/Views/History/ClosedTab.dart';
import 'package:mergeme/Views/History/CompletedTab.dart';
import 'package:mergeme/Views/History/TabBar.dart';
import 'package:mergeme/Views/History/shared_header.dart';
import 'package:mergeme/Views/Uielements/Shared.dart';
import 'package:provider_architecture/_viewmodel_provider.dart';


class ProjectPage extends StatelessWidget {

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
    return ViewModelProvider<ProjectViewModel>.withConsumer(
      onModelReady: (model){model.getNotificationFromDataBase();},
      viewModelBuilder: ()=>ProjectViewModel(),
      builder: (context, model, child)=>
          DefaultTabController(length: 3,
            child: Scaffold(
              body: SafeArea(
                child: Stack(
                    children:[
                      SharedHeader('My Projects'),
                      // finally i got a way to display a tab and tabView seperately
                      // within the same widget tree, BRAVO!
                      Positioned(left: width(14),
                          right: 0,
                          bottom: 0,
                          top: height(69),
                          child: Column(
                            children: <Widget>[
                              Tabs(),
                            ],
                          )),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        left: width(14),
                        top: height(133),
                        child: TabBarView(
                            children: [
                              ActiveTab(model.pageStatus),
                              CompletedTab(model.pageStatus),
                              ClosedTab(),
                            ]),
                      )
                    ]
                ),
              ),
            ),
          ),
    );
  }
}
