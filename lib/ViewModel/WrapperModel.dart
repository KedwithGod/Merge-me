import 'package:mergeme/Model/Service/Auth_service.dart';
import 'package:mergeme/Model/Service/Navigator_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'BaseModel.dart';


class WrapperViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    return hasLoggedInUser;

  }
}

class NavigationService {
}