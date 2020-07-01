import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/authentication/auth-reset-password/auth-reset-password.contoller.dart';
import 'package:osmobile/app/pages/authentication/auth-reset-password/auth-reset-password.page.dart';

class AuthResetPasswordModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthResetPasswordController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AuthResetPasswordPage()),
      ];

  static Inject get to => Inject<AuthResetPasswordModule>.of();
}
