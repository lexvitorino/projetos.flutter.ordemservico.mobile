import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/authentication/auth-signup/auth-signup.contoller.dart';
import 'package:osmobile/app/pages/authentication/auth-signup/auth-signup.page.dart';

class AuthSignupModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthSignupController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AuthSignupPage()),
      ];

  static Inject get to => Inject<AuthSignupModule>.of();
}
