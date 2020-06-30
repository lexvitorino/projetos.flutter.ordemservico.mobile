import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/home/home.controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AQUI'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('AQUIII'),
            SizedBox(
              width: double.infinity,
              height: 30,
            ),
            IconButton(
              icon: Icon(Icons.highlight_off),
              onPressed: () => controller.logOut(),
            ),
          ],
        ),
      ),
    );
  }
}
