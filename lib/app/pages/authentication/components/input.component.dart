import 'package:flutter/material.dart';

class InputComponent extends StatelessWidget {
  String labelText;
  bool obscureText;
  Function validator;
  Function onSaved;

  InputComponent(
      {this.labelText, this.obscureText, this.validator, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        // autofocus: true,
        keyboardType: TextInputType.text,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Color(0xffA09C9C),
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        style: TextStyle(
          fontSize: 20,
          color: Color(0xff000000),
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
