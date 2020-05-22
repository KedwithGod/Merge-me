import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/localStorage_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'Generaltextdisplay.dart';
import 'media_query.dart';



class GeneralDropDownDisplay extends StatelessWidget {
  final String initialText;
  final List<String> dropDownList;
  final String userKey;
  final String labelText;
  final String hintText;

  GeneralDropDownDisplay(this.initialText, this.dropDownList, this.userKey,
      this.hintText, this.labelText);

  final LocalStorageService storageService =locator<LocalStorageService>();
  String dropdownValue='';

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
//                        state.didChange(newValue);
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
      });},
    );
  }}
