import 'package:flutter/material.dart';

class LogoCompoment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: EdgeInsets.fromLTRB(30, 60, 30, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        image: DecorationImage(
          image:
              new ExactAssetImage("lib/app/assets/images/auth-logo-dark.png"),
        ),
        border: Border.all(
          width: 5,
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
