import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:osmobile/app/pages/authentication/models/session.model.dart';
import 'package:osmobile/app/pages/authentication/repositories/interfaces/session.interface.dart';
import 'package:osmobile/app/pages/authentication/repositories/session.repository.dart';
import 'package:osmobile/app/shared/services/interfaces/local-storage.interface.dart';
import 'package:osmobile/app/shared/services/shared-local-storage.service.dart';

part 'authentication.controller.g.dart';

class AuthenticationController = _AuthenticationControllerBase
    with _$AuthenticationController;

abstract class _AuthenticationControllerBase with Store {
  final ISession _session = Modular.get<SessionRepository>();
  final ILocalStorage storage = Modular.get<SharedLocalStorageService>();

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
    storage.get("token").then((value) {
      sessionModel = SessionModel(token: value);
      setToken(value);
    });
  }

  @action
  Future logIn(String email, String password) async {
    sessionModel = await _session.logIn(email, password);
  }

  @action
  Future logOut() async {
    await _session.logOut();
  }
}

enum AuthStatus { loading, logIn, logOut }
