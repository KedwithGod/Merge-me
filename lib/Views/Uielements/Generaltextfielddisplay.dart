import 'package:flutter/material.dart';

import 'media_query.dart';

class GeneralTextField extends StatefulWidget {
  final TextInputType keyInputType;
  final String textFieldValue;
  final int textFieldLineSpan;
  final String textFieldLabel;
  final String textFieldHint;
  final IconData textFieldIcon;
  final String functionValue;
  final Color textFieldLabelColor;

  const GeneralTextField(
      this.keyInputType,
      this.textFieldValue,
      this.textFieldLabel,
      this.textFieldHint,
      this.textFieldIcon,
      this.functionValue,
      this.textFieldLineSpan,
      this.textFieldLabelColor);

  @override
  _GeneralTextFieldState createState() => _GeneralTextFieldState();
}

class _GeneralTextFieldState extends State<GeneralTextField> {
  bool isValidPhoneNumber(String input) {
    final RegExp regex = new RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\d\d$');
    return regex.hasMatch(input);
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
      child: TextFormField(
        keyboardType: widget.keyInputType,
        onChanged: (val) {
          setState(() {
            val = widget.textFieldValue;
          });
        },
        maxLines: widget.textFieldLineSpan,
        autofocus: false,
        validator: (value) {
          if (widget.functionValue == 'email') {
            return isValidEmail(value)
                ? null
                : 'Please enter a valid email address';
          } else if (widget.functionValue == 'name') {
            return value.isEmpty ? 'Value  is required' : null;
          } else if (widget.functionValue == 'password') {
            return isValidPassword(value)
                ? null
                : 'please enter a valid password';
          }
          ;
          return null;
        },
        style: TextStyle(
            color: Colors.blue,
            fontSize: dynamicSize.height(14 / 667),
            fontWeight: FontWeight.w600),
        autocorrect: true,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.textFieldIcon,
            color: Colors.blue,
          ),
          labelText: '${widget.textFieldLabel}',
          hintStyle: TextStyle(color: Colors.grey[300]),
          hintText: '${widget.textFieldHint}',
          labelStyle: TextStyle(
              fontSize: dynamicSize.height(12 / 667),
              color: widget.textFieldLabelColor,
              fontWeight: FontWeight.w400),
          contentPadding: EdgeInsets.fromLTRB(
              dynamicSize.height(12 / 667),
              dynamicSize.height(2 / 667),
              dynamicSize.height(2 / 667),
              dynamicSize.height(2 / 667)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  dynamicSize.height (11 / 667))
                    )),
        ),
    );
  }
}
