import 'package:flutter/material.dart';

class QuestionComponent extends StatelessWidget {
  String labelQuestion;
  String labelResponse;
  Function onPressed;

  QuestionComponent({this.labelQuestion, this.labelResponse, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          labelQuestion,
          style: TextStyle(
            color: Color(0xffA09C9C),
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
              color: Color(0xff000000),
              fontSize: 14,
            ),
          ),
          onTap: onPressed,
        ),
      ],
    );
  }
}
