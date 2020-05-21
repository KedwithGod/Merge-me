import 'package:get_it/get_it.dart';
import 'package:mergeme/Views/Work/Landingpage.dart';
import 'Navigator_service.dart';
import 'localStorage_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  var instance = LocalStorageService();
  locator.registerSingleton<LocalStorageService>(instance);
  locator.registerLazySingleton(() => NavigatorService());

}