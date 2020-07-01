import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/authentication/auth-signin/auth-signin.contoller.dart';
import 'package:osmobile/app/pages/authentication/auth-signin/auth-signin.page.dart';

class AuthSigninModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthSigninController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AuthSigninPage()),
      ];

  static Inject get to => Inject<AuthSigninModule>.of();
}
