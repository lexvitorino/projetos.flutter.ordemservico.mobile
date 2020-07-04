import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/user/user.model.dart';

class UserItem extends StatelessWidget {
  final UserModel model;

  UserItem({
    @required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: ListTile(
          leading: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(48),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("lib/app/assets/images/profile-picture.png"),
              ),
            ),
          ),
          title: Text(model.name),
          subtitle: Text(model.email),
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 15),
      ),
      onTap: () {
        Modular.to.pushNamed('/user/detail/' + model.id.toString());
      },
    );
  }
}
