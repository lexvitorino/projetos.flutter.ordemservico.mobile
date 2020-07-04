import 'package:flutter/material.dart';
import 'package:osmobile/app/theme/colors.dart';

class CheckboxCompoent extends StatelessWidget {
  final String title;
  final Function onChanged;

  CheckboxCompoent({this.title, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      contentPadding: EdgeInsets.only(left: 5),
      child: CheckboxListTile(
        title: Text(
          title,
          style: TextStyle(
            color: neutralColor,
          ),
        ),
        value: false,
        onChanged: onChanged,
        activeColor: neutralColor,
        controlAffinity:
            ListTileControlAffinity.leading, //  <-- leading Checkbox
      ),
    );
  }
}
