import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/authentication/auth-change-password/auth-change-password.contoller.dart';
import 'package:osmobile/app/pages/authentication/auth-change-password/auth-change-password.page.dart';

class AuthChangePasswordModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthChangePasswordController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AuthChangePasswordPage()),
      ];

  static Inject get to => Inject<AuthChangePasswordModule>.of();
}
