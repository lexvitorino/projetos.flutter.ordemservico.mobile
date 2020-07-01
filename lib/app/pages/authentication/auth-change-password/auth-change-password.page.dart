import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/authentication/auth-change-password/auth-change-password.contoller.dart';
import 'package:osmobile/app/pages/authentication/components/input.component.dart';
import 'package:osmobile/app/pages/authentication/components/logo.component.dart';
import 'package:osmobile/app/pages/authentication/components/submit.component.dart';
import 'package:osmobile/app/shared/dialogs/modal.dialog.dart';

class AuthChangePasswordPage extends StatefulWidget {
  final String email;

  const AuthChangePasswordPage({Key key, this.email}) : super(key: key);

  @override
  AuthChangePasswordStatePage createState() => AuthChangePasswordStatePage();
}

class AuthChangePasswordStatePage
    extends ModularState<AuthChangePasswordPage, AuthChangePasswordController> {
  final _formKey = GlobalKey<FormState>();
  String password = "";
  String newpassword = "";
  String repassword = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4680FF),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 80, 30, 0),
          child: Card(
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: 30,
                ),
                LogoCompoment(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Crie sua nova senha!",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xffA09C9C),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Text(
                          widget.email,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      InputComponent(
                        labelText: "Senha recebida",
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Senha obrigatório';
                          }
                          return null;
                        },
                        onSaved: (password) => {
                          setState(() => {
                                this.password = password,
                              })
                        },
                      ),
                      InputComponent(
                        labelText: "Nova senha",
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Senha obrigatório';
                          }
                          return null;
                        },
                        onSaved: (newpassword) => {
                          setState(() => {
                                this.newpassword = newpassword,
                              })
                        },
                      ),
                      InputComponent(
                        labelText: "Repita a nova senha",
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Senha obrigatório';
                          }
                          return null;
                        },
                        onSaved: (repassword) => {
                          setState(() => {
                                this.repassword = repassword,
                              })
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SubmitComponent(
                        labelButton: "Criar senha",
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            controller.changePassword(widget.email, password,
                                newpassword, repassword);
                            if (controller.errorModel.hasError()) {
                              ModalDialog.showAlert(
                                context,
                                "Atenção",
                                controller.errorModel.message(),
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
