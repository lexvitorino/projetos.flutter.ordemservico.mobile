import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/authentication/components/input.component.dart';
import 'package:osmobile/app/pages/user/user.controller.dart';
import 'package:osmobile/app/shared/components/loading.component.dart';
import 'package:osmobile/app/shared/dialogs/modal.dialog.dart';
import 'package:osmobile/app/shared/models/error.model.dart';

class UserEditPage extends StatefulWidget {
  final String id;

  const UserEditPage({Key key, this.id}) : super(key: key);

  @override
  _UserEditPageState createState() => _UserEditPageState();
}

class _UserEditPageState extends ModularState<UserEditPage, UserController> {
  final _formKey = new GlobalKey<FormState>();

  onSubmit() {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    save();
  }

  save() {
    controller.save().then((_) {
      onSuccess();
    }).catchError((e) {
      controller.errorModel = ErrorModel(errors: e);
      onError();
    });
  }

  onSuccess() {
    Modular.to.pushReplacementNamed('/user');
  }

  onError() {
    if (controller.errorModel.hasError()) {
      ModalDialog.showAlert(
        context,
        "Atenção",
        controller.errorModel.message(),
      );
    }
  }

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
        title: controller.userModel.id == null || controller.userModel.id == 0
            ? Text("Novo Contato")
            : Text("Editar Contato"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              InputComponent(
                labelText: "Nome",
                textInputType: TextInputType.text,
                textCapitalization: TextCapitalization.words,
                initialValue: controller.userModel?.name,
                marginHorizontal: 0,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nome obrigatório';
                  }
                  return null;
                },
                onSaved: (email) => {
                  setState(() => {controller.userModel.email = email})
                },
              ),
              InputComponent(
                labelText: "E-mail",
                obscureText: false,
                textInputType: TextInputType.emailAddress,
                initialValue: controller.userModel?.email,
                marginHorizontal: 0,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'E-mail obrigatório';
                  }
                  return null;
                },
                onSaved: (email) => {
                  setState(() => {controller.userModel.email = email})
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: FlatButton.icon(
                  color: Theme.of(context).primaryColor,
                  onPressed: onSubmit,
                  icon: Icon(
                    Icons.save,
                    color: Theme.of(context).accentColor,
                  ),
                  label: Text(
                    "Salvar",
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
