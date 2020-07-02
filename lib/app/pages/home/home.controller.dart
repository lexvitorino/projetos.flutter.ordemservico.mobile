import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:osmobile/app/pages/authentication/authentication.controller.dart';

part 'home.controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  @action
  logOut() async {
    await Modular.get<AuthenticationController>().logOut();
    Modular.to.pushReplacementNamed('/authentication');
  }
}
