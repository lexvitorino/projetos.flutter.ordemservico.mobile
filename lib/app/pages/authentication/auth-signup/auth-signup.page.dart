import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/authentication/auth-signup/auth-signup.contoller.dart';
import 'package:osmobile/app/pages/authentication/components/input.component.dart';
import 'package:osmobile/app/pages/authentication/components/logo.component.dart';
import 'package:osmobile/app/pages/authentication/components/question.component.dart';
import 'package:osmobile/app/pages/authentication/components/submit.component.dart';
import 'package:osmobile/app/shared/dialogs/modal.dialog.dart';

class AuthSignupPage extends StatefulWidget {
  @override
  AuthSignupStatePage createState() => AuthSignupStatePage();
}

class AuthSignupStatePage
    extends ModularState<AuthSignupPage, AuthSignupController> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String email = "";
  String password = "";
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
                  "Nova conta?",
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
                        labelText: "Nome",
                        obscureText: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Nome obrigatório';
                          }
                          return null;
                        },
                        onSaved: (name) => {
                          setState(() => {
                                this.name = name,
                              })
                        },
                      ),
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
                      InputComponent(
                        labelText: "Senha",
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
                        labelText: "Repita a senha",
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
                        labelButton: "Criar conta",
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            controller.signUp(
                                name, email, password, repassword);
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
                  labelQuestion: 'Já tem uma conta?',
                  labelResponse: 'Logar',
                  onPressed: () => {
                    Modular.to.pop('/authentication/signin'),
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
