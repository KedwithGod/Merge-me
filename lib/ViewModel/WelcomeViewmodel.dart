import 'package:mergeme/Model/Service/Auth_service.dart';
import 'package:mergeme/Model/Service/DateTime_service.dart';
import 'package:mergeme/Model/Service/Navigator_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/UserModel/userModel.dart';
import 'package:mergeme/ViewModel/BaseModel.dart';
import 'package:provider/provider.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;

class WelcomeViewModel extends BaseModel{
  final AuthenticationService _authenticationService =
  locator<AuthenticationService>();
  final NavigatorService _navigationService = locator<NavigatorService>();

  updateUser() async {
    return await _authenticationService.welcomeBack();;
  }

  userLocation(context) async{
    return  Provider.of<UserLocation>(context,listen:false);
  }

  Future landingPage() {
    return _navigationService.nextPage(route.LandingPageRoute);
  }

  String time=currentTime();
  List get timeString=>time.split('');

  greeting(){

    if(timeString[timeString.length-2]=='a' ||timeString[timeString.length-2]=='A'){
      print('value');
      if(timeString.length==7){
        if(int.parse(timeString[0])>=1 && int.parse(timeString[0])<=9)
        {
          return 'Good morning';
        }}

      else if(timeString.length>7){
        if(timeString[0]=='1' ){
          if (timeString[1]=='0' || timeString[1]=='1' ||  timeString[1]=='2'){
            return 'Good morning';
          }

        }

      }

    }
    else if(timeString[timeString.length-2]=='p' ||timeString[timeString.length-2]=='P'){

      if (timeString.length==7)
      {if(int.parse(timeString[0])>=1 && int.parse(timeString[0])<=4)
      {
        return 'Good afternoon';
      }
      else if(int.parse(timeString[0])>=5 && int.parse(timeString[0])<=9)
      {
        return 'Good Evening';
      }
      }

      else if(timeString.length>7){
        if(timeString[0]=='1' ){
          if (timeString[1]=='0' || timeString[1]=='1' || timeString[1]=='2'){
            return 'How was your day';
          }

        }

      }
    }

    return 'Good day';

  }

  String get greet=>greeting();


}