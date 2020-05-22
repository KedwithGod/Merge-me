import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'media_query.dart';

class GeneralTextField extends StatelessWidget {
  final TextInputType keyInputType;
  final TextEditingController textFieldController;
  final int textFieldLineSpan;
  final String textFieldLabel;
  final String textFieldHint;
  final dynamic functionValue;
  final String choosePage;

  const GeneralTextField(
    this.choosePage,
    this.keyInputType,
    this.textFieldController,
    this.textFieldLabel,
    this.textFieldHint,
    this.functionValue,
    this.textFieldLineSpan,
  );

  int isValidPhoneNumber(String input) {
    var potentialNumber = int.tryParse(input);
    return potentialNumber;
  }

  bool isValidPassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool isValidEmail(String input) {
    final RegExp regex = new RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    return regex.hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveSize dynamicSize = ResponsiveSize(context);
    return SafeArea(
      child: Container(
        height: choosePage=='Login'?dynamicSize.height(54 / 667):dynamicSize.height(58 / 667),
        width: dynamicSize.width(314 / 375),
        child: TextFormField(
          cursorColor: Colors.black,
          keyboardType: keyInputType,
          controller: textFieldController,
          maxLines: textFieldLineSpan,
          autofocus: false,
          validator: (value) {
            if (functionValue == 'email') {
              return isValidEmail(value)
                  ? null
                  : 'Please enter a valid email address';

            }
            else if (functionValue=='NIN'){
              var nin = int.tryParse(value);
              if (nin == null || nin<8){
                return 'Nin value is invalid';
              }
            }
            else if (functionValue == 'name') {
              return value.isEmpty ? 'Value  is required' : null;
            }
            else if (functionValue=='workPhone' || functionValue=='mobilePhone'){
              var potentialNumber = int.tryParse(value);
              if (potentialNumber == null) {
                return 'Enter a phone number';
            }

            return null;
          }
            return null;
            },
          style: TextStyle(
              color: Colors.black,
              fontSize: dynamicSize.height(15 / 667),
              fontWeight: FontWeight.w600),
          autocorrect: true,
          decoration: InputDecoration(
              labelText: '$textFieldLabel',
              hintStyle: TextStyle(
                  fontSize: dynamicSize.height(13 / 667),
                  color: Color.fromRGBO(170, 170, 170, 0.8)),
              hintText: '$textFieldHint',
              labelStyle: TextStyle(
                  fontSize: dynamicSize.height(14 / 667),
                  color: Colors.black54,
                  fontWeight: FontWeight.w400),
              contentPadding: EdgeInsets.fromLTRB(
                  dynamicSize.width(20 / 357),
                  dynamicSize.height(30 / 667),
                  dynamicSize.width(2 / 357),
                  dynamicSize.height(2 / 667)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromRGBO(238, 83, 79, 1.0),
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius:
                  BorderRadius.circular(dynamicSize.height(11 / 667))),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:Color.fromRGBO(238, 83, 79, 1.0),
                      width: 1.0,
                      style: BorderStyle.solid),
                  borderRadius:
                      BorderRadius.circular(dynamicSize.height(11 / 667)))),
        ),
      ),
    );
  }
}