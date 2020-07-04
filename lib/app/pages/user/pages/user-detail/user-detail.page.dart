import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/user/pages/user-detail/components/user-detail-description.component.dart';
import 'package:osmobile/app/pages/user/pages/user-detail/components/user-detail-image.component.dart';
import 'package:osmobile/app/pages/user/user.controller.dart';
import 'package:osmobile/app/shared/components/loading.component.dart';
import 'package:osmobile/app/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetailPage extends StatefulWidget {
  final String id;

  const UserDetailPage({Key key, this.id}) : super(key: key);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState
    extends ModularState<UserDetailPage, UserController> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.getById(widget.id),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          controller.userModel = snapshot.data;
          return page(context);
        }
        return LoadingComponent();
      },
    );
  }

  Widget page(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuário"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
            width: double.infinity,
          ),
          UserDetailImage(
            image: controller.userModel.avatar == null
                ? ""
                : controller.userModel.avatar.url,
          ),
          SizedBox(
            height: 10,
          ),
          UserDetailDescription(
            name: controller.userModel.name,
            email: controller.userModel.email,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  launch("mailto://${controller.userModel.email}");
                },
                color: Theme.of(context).primaryColor,
                shape: CircleBorder(
                  side: BorderSide.none,
                ),
                child: Icon(
                  Icons.email,
                  color: Theme.of(context).accentColor,
                ),
              ),
              FlatButton(
                onPressed: () {},
                color: Theme.of(context).primaryColor,
                shape: CircleBorder(
                  side: BorderSide.none,
                ),
                child: Icon(
                  Icons.camera_enhance,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Container(
              width: double.infinity,
              height: 50,
              color: dangerColor,
              child: FlatButton(
                child: Text(
                  "Excluir Contato",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to
              .pushNamed('/user/edit/' + controller.userModel.id.toString());
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.edit,
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}
