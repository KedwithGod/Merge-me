import 'package:mergeme/Model/Service/Navigator_service.dart';
import 'package:mergeme/Model/Service/localStorage_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:mergeme/Model/enums/viewstate.dart';
import 'BaseModel.dart';


class HomeViewModel extends BaseModel {
  final NavigatorService _navigationService = locator<NavigatorService>();
  final LocalStorageService storageService =locator<LocalStorageService>();
  var getData;

 Future login(){
    return _navigationService.nextPage(route.LoginRoute);
  }

  Future signUp(){
    return _navigationService.nextPage(route.SignUpRoute);
  }

  Future logout({bool success = true}) async {
    await Future.delayed(Duration(seconds: 1));
    setState(ViewState.Busy);
    if (!success) {
      setErrorMessage('Error has occured during sign out');
    } else {
      _navigationService.goBack();
    }
    setState(ViewState.Idle);
  }

  wrapperData(){

    storageService.getData(route.isLoggedIn).then((onValue){
      getData=onValue;
      print (getData);
      notifyListeners();
    });
  }

}