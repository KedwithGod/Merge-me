import 'package:mergeme/Model/Service/Navigator_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'package:mergeme/Model/enums/viewstate.dart';


import 'BaseModel.dart';

class LoginViewModel extends BaseModel {
  final NavigatorService _navigationService = locator<NavigatorService>();
  Future signUp(){
    return _navigationService.nextPage(route.SignUpRoute);
  }

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
}