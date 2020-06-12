import 'package:mergeme/Model/Service/Navigator_service.dart';
import 'package:mergeme/Model/Service/localStorage_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:mergeme/ViewModel/BaseModel.dart';

class JobPageViewModel extends BaseModel{
  // locator services
  final NavigatorService _navigationService = locator<NavigatorService>();
  final LocalStorageService _storageService = locator<LocalStorageService>();

  //  need field variables
  var idFromStorage;
  var selectedTrade='trade';
  var locationValue;
  var jobPosterName;
  var postJobFilePath;
  var postJobMultipleFilePath;
  var noOfFileUploaded;
  var singleFileUploaded;
  Map<dynamic, dynamic> multipleFileUploaded;

  // get field variable forms shared preferences
















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