import 'package:get_it/get_it.dart';
import 'package:mergeme/Model/Service/Navigator_service.dart';

GetIt locator = GetIt.instance();
void setupLocator() {
  locator.registerLazySingleton(() => NavigatorService());
}