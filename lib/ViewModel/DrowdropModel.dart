import 'package:mergeme/Model/Service/Navigator_service.dart';
import 'package:mergeme/Model/Service/localStorage_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:mergeme/Model/enums/viewstate.dart';
import 'BaseModel.dart';

class DropDownViewModel extends BaseModel {
  final NavigatorService _navigationService = locator<NavigatorService>();
  final LocalStorageService storageService =locator<LocalStorageService>();


  Future login({bool success = true}) async {
    setState(ViewState.Busy);
    await Future.delayed(Duration(seconds: 1));

    if (!success) {
      setErrorMessage('Error has occured with the login');
    } else {
      _navigationService.navigateTo(route.HomeRoute, arguments: '\nFilledStacks');
      setErrorMessage(null);
    }

    setState(ViewState.Idle);
  }

  setData(String userKey, userValue){
    setState(ViewState.Busy);
    storageService.setUser(userKey, userValue);
    setState(ViewState.Idle);
  }
}