import 'package:flutter/material.dart';
import 'package:mergeme/Model/Service/localStorage_service.dart';
import 'package:mergeme/Model/Service/locator_setup.dart';

import 'Generaltextdisplay.dart';
import 'media_query.dart';

class GeneralDropDownDisplay extends StatefulWidget {
  final String initialText;
  final List<String> dropDownList;
  final String userKey;
  final String labelText;
  final String hintText;

  GeneralDropDownDisplay(this.initialText, this.dropDownList, this.userKey,
       this.hintText, this.labelText);

  @override
  _GeneralDropDownDisplayState createState() => _GeneralDropDownDisplayState();
}

class _GeneralDropDownDisplayState extends State<GeneralDropDownDisplay> {
  String dropdownValue = '';
  final LocalStorageService storageService = locator<LocalStorageService>();

  @override
  Widget build(BuildContext context) {
    ResponsiveSize dynamicSize = ResponsiveSize(context);
    return FormField(builder: (FormFieldState state) {
      return InputDecorator(
          decoration: InputDecoration(
            filled: false,
              labelStyle: TextStyle(
                  fontSize: dynamicSize.height(14 / 667),
                  color: Colors.black54,
                  fontWeight: FontWeight.w400),
              contentPadding: EdgeInsets.fromLTRB(
                  dynamicSize.width(20 / 357),
                  dynamicSize.height(30 / 667),
                  dynamicSize.width(10 / 357),
                  dynamicSize.height(2 / 667)),
              border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(dynamicSize.height(11 / 667))),
              labelText: widget.labelText,
              hintStyle: TextStyle(
                color: Color.fromRGBO(215, 215, 215, 0.6),
                fontSize: dynamicSize.height(10 / 667),
                fontWeight: FontWeight.w200,
              ),
              hintText: widget.hintText,
              errorText: state.hasError ? state.errorText : null),
          isEmpty:dropdownValue==widget.initialText,
          child: new DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              icon: Icon(Icons.edit),
              value: dropdownValue,
              isDense: true,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                  storageService.setUser(widget.userKey, newValue);
                  state.didChange(newValue);
                  print (dropdownValue);
                });
              },
              
              items: widget.dropDownList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: GeneralTextDisplay(value, Colors.black
                      , 1, 13,
                      FontWeight.normal, 'semantics for dropdownmenu  '),
                );
              }).toList(),
            ),
          ));
    }, validator: (val) {
      return val != '' ? null : 'Please select a Location';
    });
  }
}
