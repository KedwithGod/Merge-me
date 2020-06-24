import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/Auth_service.dart';
import 'package:mergeme/Model/Service/localStorage_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/UserModel/userModel.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:mergeme/Model/enums/viewstate.dart';
import 'package:mergeme/Views/Uielements/Generaltextdisplay.dart';

class BaseModel with ChangeNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final LocalStorageService storageService = locator<LocalStorageService>();

  ViewState _state = ViewState.Idle;
  bool loading = true;
  String _errorMessage;

  ViewState get state => _state;
  bool netStat;
  BuildContext context;
  var notificationValue;
  var notification;
  var jobPoster;
  bool isLoggedIn = false;
  bool onBidClicked = false;
  List tradeList = [''];
  List tradeCategory = [''];
  List termsAndConditions = [];

  var listener;

  User get currentUser => _authenticationService.currentUser;

  String get errorMessage => _errorMessage;

  bool get hasErrorMessage => _errorMessage != null && _errorMessage.isNotEmpty;

  setBidClicked() {
    onBidClicked = !onBidClicked;
    notifyListeners();
  }

  void setErrorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  waitingFunction() async {
    await Future.delayed(Duration(seconds: 3));
    loading = false;
    notifyListeners();
  }

  getNotificationFromDataBase(context) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection(route.BidFireStoreDocument)
            .document(currentUser!=null?currentUser.id:'')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            notificationValue = 0;
            print('...notification: no data');
            notifyListeners();
          }
          if (snapshot.hasError) {
            notificationValue = 0;
            print('...notification: ${snapshot.error}');
            notifyListeners();
          }
          if (snapshot.hasData) {
            print('...notification: ${snapshot.data.document}');
            return ListView.builder(
                itemCount: snapshot.data == null
                    ? 0
                    : snapshot.data[route.Notification],
                itemBuilder: (context, index) {

                  snapshot.data.documents == null
                      ? notification = []
                      :
                          notification.add(snapshot.data.documents[index]);
                          notifyListeners();


                  return null;
                });
          }
          return null;
        });
  }

  getNotificationValue(context) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection(route.BidFireStoreDocument)
            .document(route.Notification)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {

            notificationValue = 0;
            print('...notification: no data');
            notifyListeners();
          }
          if (snapshot.hasError) {
            notificationValue = 0;
            print('...notification: ${snapshot.error}');
            notifyListeners();
          }
          if (snapshot.hasData) {
            print('...notification: ${snapshot.data.document}');
            var dataGotten;
            snapshot.data == null
                ?notificationValue=0
                : dataGotten = snapshot.data.data;

            if (dataGotten != null || dataGotten!=0) {
              dataGotten.forEach((key, value) {
                notificationValue=value;
                print('notification from baseModel:$notificationValue');
                notifyListeners();
              });
            }
          }
          return null;
        });
  }

  networkConnection() {
    return listener = DataConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case DataConnectionStatus.connected:
          netStat = true;
          notifyListeners();
          return netStat;
          break;
        case DataConnectionStatus.disconnected:
          netStat = false;
          notifyListeners();
          return netStat;
          break;
      }
      return netStat;
    });
  }

  // dispose listener
  disposeListener() {
    listener.cancel();
  }

  checkLogin() async {
    isLoggedIn = await storageService.getBool(route.isLoggedIn);
    notifyListeners();
  }

  getTradeCategoryFromDataBase(child) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('DataBase/Trade/TradeCategory')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return GeneralTextDisplay(
                'loading..',
                Colors.black87,
                1,
                13,
                FontWeight.w400,
                'place holder at get tradeCategory from database');
            ;
          }
          if (snapshot.hasError) {
            print('...tradeData error: ${snapshot.error}');
          }
          if (snapshot.hasData) {
            tradeCategory = [''];
            List goodBoy;
            print('...tradeData: ${snapshot.data}');
            snapshot.data == null
                ? tradeCategory = ['']
                : snapshot.data.documents != null
                    ? goodBoy = snapshot.data.documents
                    : null;
            goodBoy != null
                ? goodBoy.map((e) {
                    tradeCategory.length > 4 ? tradeList = [''] : null;
                    tradeCategory.add(e.documentID);
                    notifyListeners();
                  }).toList()
                : null;

            print('tradeCategory :$tradeCategory');
            return child;
          }
          return null;
        });
  }

  getTradeFromDataBase(tradeName, child) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('DataBase/Trade/TradeCategory')
            .document(tradeName)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return GeneralTextDisplay('loading..', Colors.black87, 1, 13,
                FontWeight.w400, 'place holder at get trade from database');
          }
          if (snapshot.hasError) {
            print('...tradeData error: ${snapshot.error}');
          }
          if (snapshot.hasData) {
            Map dataGotten = {};
            print('...tradeData: ${snapshot.data}');
            snapshot.data == null
                ? tradeList = ['']
                : dataGotten = snapshot.data.data;

            if (dataGotten != {}) {
              tradeList = [''];
              dataGotten.forEach((key, value) {
                tradeList.length > 4 ? tradeList = [''] : null;
                tradeList.add(value);
              });
              notifyListeners();
              print(tradeList);
              print(dataGotten);
            }
            return child;
          }
          return null;
        });
  }

  getTermsAndConditions(context) {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('DataBase')
            .document('Terms and Conditions')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          if (snapshot.hasError) {
            print('...terms and condition error: ${snapshot.error}');
          }
          if (snapshot.hasData) {
            Map dataValue = {};
            snapshot.data.data == null
                ? termsAndConditions = []
                : dataValue = snapshot.data.data;
            dataValue == null
                ? termsAndConditions = []
                : dataValue.forEach((key, value) {
                    termsAndConditions.add(value);
                  });

            return AlertDialog(
              title: GeneralTextDisplay('Terms and Condition', Colors.black, 1,
                  16, FontWeight.w600, 'terms and condition title'),
              content: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                  'assets/Merge.PNG',
                ))),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: GeneralTextDisplay(
                          termsAndConditions != [] ? '${index + 1}.' : '',
                          Color.fromRGBO(238, 83, 79, 1.0),
                          1,
                          14,
                          FontWeight.w400,
                          'terms and condition label'),
                      title: GeneralTextDisplay(
                          termsAndConditions != []
                              ? '${termsAndConditions[index]}'
                              : '',
                          Color.fromRGBO(20, 20, 20, 1.0),
                          20,
                          12,
                          FontWeight.w400,
                          'terms and condition label'),
                    );
                  },
                ),
              ),
            );
          }
          return null;
        });
  }
}
