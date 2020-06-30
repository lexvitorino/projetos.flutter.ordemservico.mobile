import 'package:flutter/material.dart';

class CheckboxCompoent extends StatelessWidget {
  String title;
  Function onChanged;

  CheckboxCompoent({this.title, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      contentPadding: EdgeInsets.only(left: 5),
      child: CheckboxListTile(
        title: Text(title),
        value: false,
        onChanged: onChanged,
        controlAffinity:
            ListTileControlAffinity.leading, //  <-- leading Checkbox
      ),
    );
  }
}
