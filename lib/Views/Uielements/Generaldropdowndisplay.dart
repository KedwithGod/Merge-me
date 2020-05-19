import 'package:flutter/material.dart';
import 'file:///C:/Users/user/Documents/Flutter_projects/merge_me/lib/Views/Uielements/Generaltextdisplay.dart';

class GeneralDropDownDisplay extends StatefulWidget {
  final String initialText;
  final List<String> dropDownList;

  GeneralDropDownDisplay(this.initialText, this.dropDownList);

  @override
  _GeneralDropDownDisplayState createState() => _GeneralDropDownDisplayState();
}

class _GeneralDropDownDisplayState extends State<GeneralDropDownDisplay> {
  String dropdownValue = '';

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return FormField(builder: (FormFieldState state) {
      return InputDecorator(
          decoration: InputDecoration(
              labelStyle: TextStyle(
                  fontSize: orientation == Orientation.portrait
                      ? MediaQuery.of(context).size.height * 0.027
                      : MediaQuery.of(context).size.width * 0.027,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                  borderRadius: orientation == Orientation.portrait
                      ? BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.017)
                      : BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.017,
                        )),
              prefixIcon: const Icon(Icons.location_on),
              labelText: 'Location',
              hintText: 'City',
              errorText: state.hasError ? state.errorText : null),
          isEmpty: dropdownValue == widget.initialText,
          child: new DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue,
              isDense: true,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                  Utility.Setlocation(newValue);
                  state.didChange(newValue);
                });
              },
              items: widget.dropDownList
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: GeneralTextDisplay(value, Colors.black, 1,
                      13, FontWeight.normal,'semantics for dropdownmenr  '),
                );
              }).toList(),
            ),
          ));
    }, validator: (val) {
      return val != '' ? null : 'Please select a Location';
    });
  }
}
