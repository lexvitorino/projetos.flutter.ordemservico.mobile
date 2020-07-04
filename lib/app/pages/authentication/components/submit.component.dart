import 'package:flutter/material.dart';
import 'package:osmobile/app/theme/colors.dart';

class SubmitComponent extends StatelessWidget {
  String labelButton;
  Function onPressed;

  SubmitComponent({this.labelButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: FlatButton(
        child: Text(
          labelButton,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
