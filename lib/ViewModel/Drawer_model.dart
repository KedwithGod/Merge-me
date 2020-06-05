
import 'package:mergeme/Model/Service/Auth_service.dart';
import 'package:mergeme/Model/Service/Navigator_service.dart';
import 'package:mergeme/Model/Service/dialog_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/ViewModel/BaseModel.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;

class DrawerModel extends BaseModel{
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigatorService _navigationService = locator<NavigatorService>();

  // Sign out user
  signOut() async {
   try{await _authenticationService.signOut();
      _navigationService.nextPage(route.HomeRoute);}
     catch(e){
    await _dialogService.showDialog(
      title: 'Sign out Failure',
      description: '$e. Please try again later',
    );}
  }

  Future landingPage() {
    return _navigationService.nextPage(route.LandingPageRoute);
  }
  }