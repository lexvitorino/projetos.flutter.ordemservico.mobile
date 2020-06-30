import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/app.controller.dart';
import 'package:osmobile/app/app.widget.dart';
import 'package:osmobile/app/pages/authentication/auth-signin/auth-signin.module.dart';
import 'package:osmobile/app/pages/authentication/authentication.controller.dart';
import 'package:osmobile/app/pages/authentication/repositories/interfaces/session.interface.dart';
import 'package:osmobile/app/pages/authentication/repositories/session.repository.dart';
import 'package:osmobile/app/pages/home/home.controller.dart';
import 'package:osmobile/app/pages/home/home.module.dart';
import 'package:osmobile/app/pages/splash/splash.page.dart';
import 'package:osmobile/app/shared/repositories/client-http.repository.dart';
import 'package:osmobile/app/shared/repositories/interfaces/client-http.interface.dart';
import 'package:osmobile/app/shared/services/interfaces/local-storage.interface.dart';
import 'package:osmobile/app/shared/services/shared-local-storage.service.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => HomeController()),
        Bind<IClientHttp>((i) => ClientHttpRepository()),
        Bind<ILocalStorage>((i) => SharedLocalStorageService()),
        Bind<ISession>((i) => SessionRepository()),
        Bind((i) => AuthenticationController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
        Router('/signin', module: AuthSigninModule()),
        Router('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
