import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mergeme/Model/Service/Bloc_settings.dart';
import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/Navigator_service.dart';
import 'package:mergeme/Model/Service/localStorage_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:mergeme/Views/Uielements/Generaldropdowndisplay.dart';

class MainBloc extends BloCSetting {

  final NavigatorService _navigationService = locator<NavigatorService>();
  final LocalStorageService storageService = locator<LocalStorageService>();
  var specificTradeVal;
  var tutorOption;
  var noOfUser;

  // no of user retrieval
  update(){
    updateNoOfUser();
  }
  updateNoOfUser() async {

    Firestore.instance.collection("Merge me").document('Users').get().then((value){
      noOfUser=(value.data['No of Users']);
    });
    await rebuildWidgets(ids: [route.NoOfUser]);
  }

  // local storage data retrieval
  updateValue() async {
    await storageService.getData(tradeCategory).then((onValue){
      specificTradeVal=onValue;
    });
    await storageService.getData(route.tutorOption).then((onValue){
      tutorOption=onValue;

    });

    await rebuildWidgets(ids: ['Sign in']);
  }

// route navigation
  Future navigate(routeName){
    return _navigationService.nextPage(routeName);
  }

  int s = 0;
  var tradeName;
  var tradeCategory;
  Function onTapHandler;
  bool toggleView = false;
  int indexValue = 0;

  // Dropdown selections

  Widget tradeSelection() {
    if (tradeCategory == 'Learn a trade') {
      return
        GeneralDropDownDisplay(
            '',
            ['',
              'Local Trade',
              'Tech Jobs',
              'Artisans',
              'Repairs'
            ],
            route.tradeCategory,
            'Choose a Trade',
            'Trade Category');
    }
    if (tradeCategory == 'Search for work') {
      return
        GeneralDropDownDisplay(
          '',
          ['',
            'Local Trade',
            'Tech Jobs',
            'Artisans',
            'Repairs'
          ],
          route.tradeCategory,
          'Choose a Trade',
          'Trade Category',);
    }


    if (tradeCategory == '' || tradeCategory == 'Give a work') {
      return Container(

          child: Text('i am rebuilt $s'),
          color: Colors.blue,
          height: 40

      );
    }

    return Container(

        child: Text('tap on $s'),
        color: Colors.blue,
        height: 40

    );
  }


  Widget tradeValue() {

    if (tradeName == route.localTrade && tradeCategory != 'Give a work') {
      return GeneralDropDownDisplay(
          '',
          ['',
            'Bead making',
            'House painting',
            'Cake making',
            'Plumbing work'
          ],
          route.localTrade,
          'Select a trade',
          'Local trade');
    }
    else if (tradeName == route.techJobs && tradeName != '' &&
        tradeCategory != 'Give a work') {
      return GeneralDropDownDisplay(
          '',
          ['',
            'Graphic Design',
            'Mobile developer',
            'Data scientist',
            'Web developer'
          ],
          route.techJobs,
          'Select a trade',
          'Tech jobs');
    }
    else if (tradeName == route.artisans && tradeName != '' &&
        tradeCategory != 'Give a work') {
      return GeneralDropDownDisplay(
          '',
          ['',
            'AutoMechanic',
            'Tailor/Seamstress',
            'Electrician',
            'Carpenter'
          ],
          route.artisans,
          'Select a trade',
          'Artisans');
    }
    else if (tradeName == route.repairs && tradeName != '' &&
        tradeCategory != 'Give a work') {
      return GeneralDropDownDisplay(
          '',
          ['',
            'Refrigerator repairs',
            'Fan repairs',
            'Television repairs',
            'Bag repairs'
          ],
          route.artisans,
          'Select a trade',
          'Repairs');
    }

    else {
      return Container(

          child: Text('i am rebuilt $s'),
          color: Colors.blue,
          height: 40);
    }
  }

  Widget onTap() {
    return Container(
        child: tradeName != '' ? Text('Select $tradeName 1 times more') : Text(
            'rebuild $s'),
        color: Colors.white,
        height: 80);
  }


  onChanged(String userKey, String userValue) async {
    onTapHandler =
        () async {
      if (tradeName != null) {
        toggleView = !toggleView;
        print(" ontap: $toggleView");
      }
    };

    if (userKey == route.trade) {
      tradeCategory = userValue;
    }
    else if (userKey == route.tradeCategory) {
      tradeName = userValue;

    }
    if (userKey==route.localTrade){
      specificTradeVal=userValue;
    }
    else if (userKey==route.artisans){
      specificTradeVal=userValue;
    }
    else if (userKey==route.repairs){
      specificTradeVal=userValue;
    }
    if (userKey==route.techJobs){
      specificTradeVal=userValue;
    }

    else if (userKey== route.tutorOption){
      tutorOption=userValue;
    }

    await rebuildWidgets(ids: ['dropdown', 'TradeSelection','Sign in']);
  }


  // index stack selection handler

  onSwipeRight() async{
    indexValue > 0 ? indexValue-- : indexValue = 0;
    print(indexValue);
    await rebuildWidgets(ids: ['swipeDetector','indexStack']);
  }

  onSwipeLeft() async {
    indexValue < 2 ? indexValue++ : indexValue = 2;
    await rebuildWidgets(ids: ['swipeDetector','indexStack',]);
    print(indexValue);
  }

  indexChange(int index) async {
    indexValue = index;
    await rebuildWidgets(ids: ['indexStack','swipeDetector']);
  }
}
MainBloc mainBloc;