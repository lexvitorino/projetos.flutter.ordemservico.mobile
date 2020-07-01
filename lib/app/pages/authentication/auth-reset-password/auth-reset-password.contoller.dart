import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:osmobile/app/pages/authentication/authentication.controller.dart';
import 'package:osmobile/app/pages/authentication/models/session.model.dart';
import 'package:osmobile/app/shared/models/error.model.dart';

part 'auth-reset-password.contoller.g.dart';

class AuthResetPasswordController = _AuthResetPasswordController
    with _$AuthResetPasswordController;

abstract class _AuthResetPasswordController with Store {
  AuthenticationController authentication = Modular.get();

  @observable
  SessionModel sessionModel;

  @observable
  ErrorModel errorModel;

  _AuthResetPasswordController() {
    errorModel = ErrorModel();
  }

  @action
  Future resetPassword(String email) async {
    try {
      sessionModel = await authentication.resetPassword(email);
      if (sessionModel != null) {
        Modular.to
            .pushReplacementNamed('/authentication/changePassword/' + email);
      }
    } catch (e) {
      errorModel = ErrorModel(errors: e);
    }
  }
}
