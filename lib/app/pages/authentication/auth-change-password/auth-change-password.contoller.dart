import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:osmobile/app/pages/authentication/authentication.controller.dart';
import 'package:osmobile/app/pages/authentication/models/session.model.dart';
import 'package:osmobile/app/shared/models/error.model.dart';

part 'auth-change-password.contoller.g.dart';

class AuthChangePasswordController = _AuthChangePasswordController
    with _$AuthChangePasswordController;

abstract class _AuthChangePasswordController with Store {
  AuthenticationController authentication = Modular.get();

  @observable
  SessionModel sessionModel;

  @observable
  ErrorModel errorModel;

  _AuthChangePasswordController() {
    errorModel = ErrorModel();
  }

  @action
  Future changePassword(String email, String password, String repassword,
      String newpassword) async {
    try {
      sessionModel = await authentication.changePassword(
          email, password, repassword, newpassword);
      if (sessionModel != null) {
        Modular.to.pushReplacementNamed('/authentication/signin');
      }
    } catch (e) {
      errorModel = ErrorModel(errors: e);
    }
  }
}
