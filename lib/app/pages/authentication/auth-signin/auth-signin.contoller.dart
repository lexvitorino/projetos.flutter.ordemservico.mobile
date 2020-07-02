import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:osmobile/app/pages/authentication/authentication.controller.dart';
import 'package:osmobile/app/pages/authentication/models/session.model.dart';
import 'package:osmobile/app/shared/models/error.model.dart';

part 'auth-signin.contoller.g.dart';

class AuthSigninController = _AuthSigninController with _$AuthSigninController;

abstract class _AuthSigninController with Store {
  AuthenticationController authentication = Modular.get();

  @observable
  SessionModel sessionModel;

  @observable
  ErrorModel errorModel;

  _AuthSigninController() {
    errorModel = ErrorModel();
  }

  @action
  Future logIn(String email, String password) async {
    try {
      sessionModel = await authentication.logIn(email, password);
      if (sessionModel != null) {
        Modular.to.pushReplacementNamed('/home');
      }
    } catch (e) {
      errorModel = ErrorModel(errors: e);
    }
  }

  @action
  Future logOut() async {
    await authentication.logOut();
    Modular.to.pushReplacementNamed('/authentication');
  }
}
