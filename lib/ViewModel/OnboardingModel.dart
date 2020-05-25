import 'package:mergeme/Model/Service/Navigator_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;
import 'BaseModel.dart';



class OnBoardingViewModel extends BaseModel {
  final NavigatorService _navigationService = locator<NavigatorService>();

  void navigateBack(){
    return _navigationService.goBack();
  }
  Future onBoardingSearchWork(){
    return _navigationService.nextPage(route.OnBoardingSearchWork);
  }

  Future onBoardingLearnTrade(){
    return _navigationService.nextPage(route.OnBoardingLearnTrade);
  }

  Future onBoardingGiveWork(){
    return _navigationService.nextPage(route.OnBoardingGiveWork);
  }
  Future getStarted(){
    return _navigationService.nextPage(route.HomeRoute);
  }

}