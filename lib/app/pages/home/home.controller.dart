import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:osmobile/app/pages/authentication/authentication.controller.dart';
import 'package:osmobile/app/pages/authentication/models/session.model.dart';
import 'package:osmobile/app/pages/authentication/repositories/interfaces/session.interface.dart';
import 'package:osmobile/app/pages/authentication/repositories/session.repository.dart';
import 'dart:io' as io;

part 'home.controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  final ISession _session = Modular.get<SessionRepository>();

  @observable
  SessionModel sessionModel;

  _HomeController() {
    _session.getToken().then((value) {
      sessionModel = value;
    });
  }

  @action
  logOut() async {
    await Modular.get<AuthenticationController>().logOut();
    Modular.to.pushReplacementNamed('/authentication');
  }
}
