import 'package:get_it/get_it.dart';
import 'Auth_service.dart';
import 'Navigator_service.dart';
import 'dialog_service.dart';
import 'localStorage_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  var instance = LocalStorageService();
  locator.registerSingleton<LocalStorageService>(instance);
  locator.registerLazySingleton(() => NavigatorService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => DialogService());

}