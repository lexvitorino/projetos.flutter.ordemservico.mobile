import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/authentication/auth-change-password/auth-change-password.contoller.dart';
import 'package:osmobile/app/pages/authentication/auth-change-password/auth-change-password.page.dart';
import 'package:osmobile/app/pages/authentication/auth-reset-password/auth-reset-password.contoller.dart';
import 'package:osmobile/app/pages/authentication/auth-reset-password/auth-reset-password.page.dart';
import 'package:osmobile/app/pages/authentication/auth-signin/auth-signin.contoller.dart';
import 'package:osmobile/app/pages/authentication/auth-signin/auth-signin.page.dart';
import 'package:osmobile/app/pages/authentication/auth-signup/auth-signup.contoller.dart';
import 'package:osmobile/app/pages/authentication/auth-signup/auth-signup.page.dart';
import 'package:osmobile/app/pages/authentication/repositories/interfaces/subscriber.interface.dart';
import 'package:osmobile/app/pages/authentication/repositories/subscriber.repository.dart';

class AuthenticationModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthSigninController()),
        Bind((i) => AuthSignupController()),
        Bind((i) => AuthResetPasswordController()),
        Bind((i) => AuthChangePasswordController()),
        Bind<ISubscriber>((i) => SubscriberRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AuthSigninPage()),
        Router('/signup', child: (_, args) => AuthSignupPage()),
        Router('/resetPassword', child: (_, args) => AuthResetPasswordPage()),
        Router('/changePassword/:email',
            child: (_, args) =>
                AuthChangePasswordPage(email: args.params['email'])),
      ];

  static Inject get to => Inject<AuthenticationModule>.of();
}
