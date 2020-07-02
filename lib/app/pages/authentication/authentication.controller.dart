import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:osmobile/app/pages/authentication/models/session.model.dart';
import 'package:osmobile/app/pages/authentication/repositories/interfaces/session.interface.dart';
import 'package:osmobile/app/pages/authentication/repositories/interfaces/subscriber.interface.dart';
import 'package:osmobile/app/pages/authentication/repositories/session.repository.dart';
import 'package:osmobile/app/pages/authentication/repositories/subscriber.repository.dart';

part 'authentication.controller.g.dart';

class AuthenticationController = _AuthenticationControllerBase
    with _$AuthenticationController;

abstract class _AuthenticationControllerBase with Store {
  final ISession _session = Modular.get<SessionRepository>();
  final ISubscriber _subscriber = Modular.get<SubscriberRepository>();

  @observable
  AuthStatus status = AuthStatus.loading;

  @observable
  SessionModel sessionModel;

  @action
  setToken(SessionModel value) {
    sessionModel = value;
    status = sessionModel == null ? AuthStatus.logOut : AuthStatus.logIn;
  }

  _AuthenticationControllerBase() {
    _session.getToken().then((value) {
      sessionModel = SessionModel(token: value);
      setToken(value);
    });
  }

  @action
  Future logIn(String email, String password) async {
    return await _session.logIn(email, password);
  }

  @action
  Future signUp(
      String name, String email, String password, String repassword) async {
    return await _subscriber.subscribers(name, email, password, repassword);
  }

  @action
  Future resetPassword(String email) async {
    return await _session.resetPassword(email);
  }

  @action
  Future changePassword(String email, String password, String newpassword,
      String repassword) async {
    return await _session.changePassword(
        email, password, newpassword, repassword);
  }

  @action
  Future logOut() async {
    await _session.logOut();
  }
}

enum AuthStatus { loading, logIn, logOut }
