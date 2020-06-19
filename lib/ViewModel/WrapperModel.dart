import 'package:mergeme/Model/Service/Auth_service.dart';
import 'package:mergeme/Model/Service/Navigator_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'BaseModel.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;

class WrapperViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  final NavigatorService _navigationService = locator<NavigatorService>();

  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    if (hasLoggedInUser) {
      _navigationService.navigateTo(route.welcomeBack);
    } else {
      _navigationService.navigateTo(route.OnBoardingGiveWork);
    }
  }
}
