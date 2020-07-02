import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:osmobile/app/pages/authentication/authentication.controller.dart';
import 'package:osmobile/app/pages/authentication/models/subscriber.model.dart';
import 'package:osmobile/app/shared/models/error.model.dart';

part 'auth-signup.contoller.g.dart';

class AuthSignupController = _AuthSignupController with _$AuthSignupController;

abstract class _AuthSignupController with Store {
  AuthenticationController authentication = Modular.get();

  @observable
  SubscriberModel subscriberModel;

  @observable
  ErrorModel errorModel;

  _AuthSignupController() {
    errorModel = ErrorModel();
  }

  @action
  Future signUp(
      String name, String email, String password, String repassword) async {
    try {
      subscriberModel =
          await authentication.signUp(name, email, password, repassword);
      if (subscriberModel != null) {
        Modular.to.pushReplacementNamed('/authentication');
      }
    } catch (e) {
      errorModel = ErrorModel(errors: e);
    }
  }
}
