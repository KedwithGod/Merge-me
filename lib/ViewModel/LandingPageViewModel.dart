
import 'package:mergeme/Model/Service/Bloc_settings.dart';

class LandingPageBloc extends BloCSetting{
  String changeSlide;

  onChanged(String userKey,String userValue) {

    rebuildWidgets(ids: []);
  }


}

LandingPageBloc landingPageBloc;