
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
   var result= await _authenticationService.signOut();
    if (result){
      _navigationService.nextPage(route.HomeRoute);
    }
    else{
    await _dialogService.showDialog(
      title: 'Sign out Failure',
      description: 'General sign out failure. Please try again later',
    );}
  }

  Future landingPage() {
    return _navigationService.nextPage(route.LandingPageRoute);
  }
  }