import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static SharedPreferences _preferences;


   dynamic _getFromDisk(String key) async{
    _preferences = await SharedPreferences.getInstance();
    var value  = _preferences.get(key);
    print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

    Future<String> getString ( value) async {
    final prefString=await SharedPreferences.getInstance();
      var gottenValue = prefString.getString(value) ?? '';
      return gottenValue;
    }

  Future<bool> getBool ( value) async {
    final prefBool=await SharedPreferences.getInstance();
    var gottenValue = prefBool.getBool(value) ?? '';
    return gottenValue;
  }


  Future<int> getInt ( value) async {
    final prefInt=await SharedPreferences.getInstance();
    var gottenValue = prefInt.getInt(value) ?? '';
    return gottenValue;
  }


  Future<List<String>> getList ( value) async {
    final prefList=await SharedPreferences.getInstance();
    var gottenValue = prefList.getStringList(value) ?? '';
    return gottenValue;
  }

  Future<double> getDouble ( value) async {
    final prefDouble=await SharedPreferences.getInstance();
    var gottenValue = prefDouble.getDouble(value) ?? '';
    return gottenValue;
  }




  void _saveToDisk<T>(String key, T content) async{
  _preferences = await SharedPreferences.getInstance();
    print('(TRACE) LocalStorageService:_saveToDisk. key: $key value: $content');

    if(content is String) {
      _preferences.setString(key, content);
    }
    if(content is bool) {
      _preferences.setBool(key, content);
    }
    if(content is int) {
      _preferences.setInt(key, content);
    }
    if(content is double) {
      _preferences.setDouble(key, content);
    }
    if(content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }

  dynamic getData (String userKey) async{
    var data = await _getFromDisk(userKey);
    if (data == null) {
      return null;
    }
    return data;
  }

  setUser<T> (String userKey, T userValue) {
  _saveToDisk(userKey, userValue);
  }

}
