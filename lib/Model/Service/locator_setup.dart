import 'package:get_it/get_it.dart';
import 'package:mergeme/Model/Database/FirebaseStorage.dart';
import 'package:mergeme/Model/constants/CountDown.dart';
import 'Auth_service.dart';
import 'Navigator_service.dart';
import 'Network_connection.dart';
import 'dialog_service.dart';
import 'firestore_service.dart';
import 'localStorage_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  var instance = LocalStorageService();
  locator.registerSingleton<LocalStorageService>(instance);
  locator.registerLazySingleton(() => NavigatorService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => FireStoreService());
  locator.registerLazySingleton(() => Firebase());
  locator.registerFactory(() => CountDown());
  locator.registerFactory(() =>Main());

}