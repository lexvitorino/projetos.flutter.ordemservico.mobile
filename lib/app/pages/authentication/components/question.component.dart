import 'package:flutter/material.dart';
import 'package:osmobile/app/theme/colors.dart';

class QuestionComponent extends StatelessWidget {
  final String labelQuestion;
  final String labelResponse;
  final Function onPressed;

  QuestionComponent({this.labelQuestion, this.labelResponse, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          labelQuestion,
          style: TextStyle(
            color: neutralColor,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          child: Text(
            labelResponse,
            style: TextStyle(
              color: evidenceColor,
              fontSize: 14,
            ),
          ),
          onTap: onPressed,
        ),
      ],
    );
  }
}
