import 'package:flutter/material.dart';

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
    Orientation orientation = MediaQuery.of(context).orientation;
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
            fontSize: orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 14 / 667
                : MediaQuery.of(context).size.width * 14 / 375,
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
              fontSize: orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.height * 12 / 667
                  : MediaQuery.of(context).size.width * 12 / 375,
              color: widget.textFieldLabelColor,
              fontWeight: FontWeight.w400),
          contentPadding: EdgeInsets.fromLTRB(
            orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 12 / 667
                : MediaQuery.of(context).size.width * 12 / 375,
            orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 2 / 667
                : MediaQuery.of(context).size.width * 2 / 375,
            orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 2 / 667
                : MediaQuery.of(context).size.width * 2 / 375,
            orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 2 / 667
                : MediaQuery.of(context).size.width * 2 / 375,
          ),
          border: OutlineInputBorder(
              borderRadius: orientation == Orientation.portrait
                  ? BorderRadius.circular(
                      MediaQuery.of(context).size.height * 11 / 667)
                  : BorderRadius.circular(
                      MediaQuery.of(context).size.width * 11 / 375,
                    )),
        ),
      ),
    );
  }
}
