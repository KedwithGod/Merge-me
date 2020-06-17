import 'BaseModel.dart';
import 'package:mergeme/Model/constants/route_path.dart' as route;

class ProjectViewModel extends BaseModel{
  // field instances
  var indexValue=0;
  var pageStatus=route.Completed;


  // functions
  onTapIndex(){
    indexValue==0?indexValue=1:indexValue=0;
    notifyListeners();
  }

}