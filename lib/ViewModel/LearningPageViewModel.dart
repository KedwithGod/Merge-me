import 'package:mergeme/ViewModel/BaseModel.dart';

class LearningPageViewModel  extends BaseModel{
  // variables
  var indexValue=0;

  // Methods
  onTapIndex(){
    indexValue==0?indexValue=1:indexValue=0;
    notifyListeners();
  }


  terminateLearning(){

  }

}