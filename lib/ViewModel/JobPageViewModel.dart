import 'package:mergeme/Model/Service/Navigator_service.dart';
import 'package:mergeme/Model/Service/localStorage_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/ViewModel/BaseModel.dart';
import 'package:quiver/async.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;

class JobPageViewModel extends BaseModel{
  // locator services
  final NavigatorService _navigationService = locator<NavigatorService>();
  final LocalStorageService _storageService = locator<LocalStorageService>();

  //  need field variables
  var idFromStorage;
  var selectedTrade;
  var locationValue;
  var jobPosterName;
  var postJobFilePath;
  var postJobMultipleFilePath;
  var noOfFileUploaded;
  var singleFileUploaded;
  var indexValue=0;
  var pageStatus=route.Active;
  Map<dynamic, dynamic> multipleFileUploaded;
  double rating=0;
  bool onComplete;
  int _elapsed=0;
  int get elapsed=>_elapsed==16?_elapsed=0:_elapsed=_elapsed;

  // get field variable forms shared preferences


    loadingWidget(){
    final cd = CountdownTimer(Duration(seconds: 15), Duration(seconds: 1));
    cd.listen((data) {
      _elapsed = cd.elapsed.inSeconds;
      notifyListeners();
    }, onDone: () {
      cd.cancel();
    });
  }












// update rating value
  updateRating(value) async{
    rating=value;
    onComplete == true

        ? await _storageService.setUser(
            'rating by ${currentUser.id}', rating)
        : null;
    notifyListeners();
  }
  onTapIndex(){
    indexValue==0?indexValue=1:indexValue=0;
    notifyListeners();
  }

  // get notification from notification page
  getBidStatus(){
    //Todo: add code for notification
  }

  // get payment status from wallet
  getPaymentStatus(){
    //Todo: add code for payment status
  }

  // get notification from Rating
  getRating(){
    //Todo: add code for Rating
  }
}