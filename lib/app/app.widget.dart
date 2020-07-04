import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/theme/ligth.theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: lightTheme(),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
