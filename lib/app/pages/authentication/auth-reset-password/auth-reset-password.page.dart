import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/authentication/auth-reset-password/auth-reset-password.contoller.dart';
import 'package:osmobile/app/pages/authentication/components/input.component.dart';
import 'package:osmobile/app/pages/authentication/components/logo.component.dart';
import 'package:osmobile/app/pages/authentication/components/question.component.dart';
import 'package:osmobile/app/pages/authentication/components/submit.component.dart';
import 'package:osmobile/app/shared/dialogs/modal.dialog.dart';

class AuthResetPasswordPage extends StatefulWidget {
  @override
  AuthResetPasswordStatePage createState() => AuthResetPasswordStatePage();
}

class AuthResetPasswordStatePage
    extends ModularState<AuthResetPasswordPage, AuthResetPasswordController> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
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
                  "Resetar sua senha?",
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
                      InputComponent(
                        labelText: "E-mail",
                        obscureText: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'E-mail obrigatório';
                          }
                          return null;
                        },
                        onSaved: (email) => {
                          setState(() => {this.email = email})
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SubmitComponent(
                        labelButton: "Resetar senha",
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            controller.resetPassword(email);
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
                QuestionComponent(
                  labelQuestion: 'Não tem uma conta?',
                  labelResponse: 'Criar conta',
                  onPressed: () => {
                    Modular.to.pushReplacementNamed('/authentication/signup'),
                  },
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
