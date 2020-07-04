import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/user/components/user-item.page.dart';
import 'package:osmobile/app/pages/user/user.controller.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends ModularState<UserPage, UserController> {
  @override
  void initState() {
    super.initState();
    controller.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuários"),
      ),
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: controller.users.length,
          itemBuilder: (ctx, i) {
            return UserItem(
              model: controller.users[i],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/user/create');
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.plus_one,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
