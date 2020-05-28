import 'package:mergeme/Model/Service/Bloc_settings.dart';
import 'package:mergeme/ViewModel/BaseModel.dart';

class LandingPageBloc extends BloCSetting{
  int indexValue=0;

    onSwipeRight(){
      indexValue>0?indexValue--:indexValue=0;
      rebuildWidgets(ids: ['swipeDetector']);
    }

  onSwipeLeft(){
    indexValue<2?indexValue++:indexValue=2;
    rebuildWidgets(ids: ['swipeDetector']);
  }

   indexChange(int index){
    indexValue=index;
    rebuildWidgets(ids: ['indexStack', 'index0', 'index1', 'index2']);
  }
}
LandingPageBloc landingPageBloc;