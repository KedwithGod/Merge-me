import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'locator.dart';
import 'mediaquery.dart';




class GeneralDropDownDisplay extends StatelessWidget {
  final String initialText;
  final List<String> dropDownList;
  final String userKey;
  final String labelText;
  final String hintText;

  GeneralDropDownDisplay(this.initialText, this.dropDownList, this.userKey,
      this.hintText, this.labelText);

  final LocalStorageService storageService =LocalStorageService();

  @override
  Widget build(BuildContext context) {

    return  StateBuilder<String>(
        //Creating a local ReactiveModel that decorates an integer value
        //with initial value of 0
        observe: () => RM.create<String>(''),
    //The builder exposes the BuildContext and the instance of the created ReactiveModel
    builder: (context,builderValue) {
    return FormField(
          builder: (FormFieldState state) {
            ResponsiveSize dynamicSize = ResponsiveSize(context);
            return InputDecorator(
                decoration: InputDecoration(
                    labelStyle: TextStyle(
                        fontSize: dynamicSize.height(14 / 667),
                        color: Colors.black54, fontWeight: FontWeight.w200),
                    contentPadding: EdgeInsets.fromLTRB(
                        dynamicSize.width(20 / 357),
                        dynamicSize.height(30 / 667),
                        dynamicSize.width(10 / 357),
                        dynamicSize.height(2 / 667)),
                    hintMaxLines: 1,
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(dynamicSize.height(11 / 667))),
                    labelText:builderValue.state==''?null:labelText,hintText:hintText,
                    errorText: state.hasError ? state.errorText : null
                ),
                isEmpty: builderValue.state== '',
                child: new DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: builderValue.state,
                    isDense: true,
                    onChanged: (String newValue) {
                        builderValue.state = newValue;
                        storageService.setUser(userKey, newValue);
                        print(builderValue.state);
                      
                    },
                    items:dropDownList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child:  Text(value)
                      );
                    })
                        .toList(),
                  ),
                ));
          },  validator: (val) {
        return val != '' ? null : 'Please select a Location';
      });});
  }}


class LocalStorageService {
  static SharedPreferences _preferences;


  dynamic _getFromDisk(String key) async{
    _preferences = await SharedPreferences.getInstance();
    var value  = _preferences.get(key);
    print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
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

  Future<dynamic> getData (String userKey) async{
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
