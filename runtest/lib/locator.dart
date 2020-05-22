import 'package:get_it/get_it.dart';

import 'localStorage.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  var instance = LocalStorageService();
  locator.registerSingleton<LocalStorageService>(instance);
  

}