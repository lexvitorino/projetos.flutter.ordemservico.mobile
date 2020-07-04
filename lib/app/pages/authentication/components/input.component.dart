import 'package:flutter/material.dart';
import 'package:osmobile/app/theme/colors.dart';

class InputComponent extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final String initialValue;
  final Function validator;
  final double marginHorizontal;
  final Function onSaved;

  InputComponent({
    this.labelText,
    this.obscureText,
    this.textInputType,
    this.textCapitalization,
    this.initialValue,
    this.validator,
    this.marginHorizontal,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: marginHorizontal, right: marginHorizontal),
      child: TextFormField(
        // autofocus: true,
        keyboardType:
            textInputType == null ? TextInputType.text : textInputType,
        obscureText: obscureText == null ? false : obscureText,
        textCapitalization: textCapitalization == null
            ? TextCapitalization.none
            : textCapitalization,
        initialValue: initialValue == null ? "" : initialValue,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: neutralColor,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        style: TextStyle(
          color: evidenceColor,
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
