import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/authentication/auth-signin/auth-signin.contoller.dart';
import 'package:osmobile/app/pages/authentication/components/checkbox.component.dart';
import 'package:osmobile/app/pages/authentication/components/input.component.dart';
import 'package:osmobile/app/pages/authentication/components/logo.component.dart';
import 'package:osmobile/app/pages/authentication/components/question.component.dart';
import 'package:osmobile/app/pages/authentication/components/submit.component.dart';

class AuthSigninPage extends StatefulWidget {
  @override
  AuthSigninStatePage createState() => AuthSigninStatePage();
}

class AuthSigninStatePage
    extends ModularState<AuthSigninPage, AuthSigninController> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4680FF),
      body: Scaffold(
        child: SingleChildScrollView(
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
                    "Fazer Login?",
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
                        CheckboxCompoent(
                          title: "Lembrar-me",
                          onChanged: (newValue) {},
                        ),
                        SubmitComponent(
                          labelButton: "Logar",
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              controller.logIn(email, password);
                            }
                            final snackBar = SnackBar(
                              content: Text('Voilá! Um SnackBar!'),
                              action: SnackBarAction(
                                label: 'Desfazer',
                                onPressed: () {},
                              ),
                            );
                            Scaffold.of(context).showSnackBar(snackBar);
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  QuestionComponent(
                    labelQuestion: 'Esqueci minha senha?',
                    labelResponse: 'Resetar Senha',
                    onPressed: () => {print("QuestionComponent1")},
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  QuestionComponent(
                    labelQuestion: 'Não tenho conta?',
                    labelResponse: 'Criar conta',
                    onPressed: () => {print("QuestionComponent2")},
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}