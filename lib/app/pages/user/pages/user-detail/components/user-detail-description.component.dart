import 'package:flutter/widgets.dart';

class UserDetailDescription extends StatelessWidget {
  final String name;
  final String email;

  UserDetailDescription({
    @required this.name,
    @required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          email,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
