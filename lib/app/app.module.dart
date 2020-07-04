import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/app.controller.dart';
import 'package:osmobile/app/app.widget.dart';
import 'package:osmobile/app/pages/authentication/authentication.controller.dart';
import 'package:osmobile/app/pages/authentication/authentication.module.dart';
import 'package:osmobile/app/pages/authentication/repositories/interfaces/session.interface.dart';
import 'package:osmobile/app/pages/authentication/repositories/interfaces/subscriber.interface.dart';
import 'package:osmobile/app/pages/authentication/repositories/session.repository.dart';
import 'package:osmobile/app/pages/authentication/repositories/subscriber.repository.dart';
import 'package:osmobile/app/pages/customer/customer.page.dart';
import 'package:osmobile/app/pages/home/home.controller.dart';
import 'package:osmobile/app/pages/home/home.module.dart';
import 'package:osmobile/app/pages/service-order/service-order.page.dart';
import 'package:osmobile/app/pages/splash/splash.page.dart';
import 'package:osmobile/app/pages/user/user.controller.dart';
import 'package:osmobile/app/pages/user/user.module.dart';
import 'package:osmobile/app/shared/repositories/client-http.repository.dart';
import 'package:osmobile/app/shared/repositories/interfaces/client-http.interface.dart';
import 'package:osmobile/app/shared/services/interfaces/local-storage.interface.dart';
import 'package:osmobile/app/shared/services/shared-local-storage.service.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind<IClientHttp>((i) => ClientHttpRepository()),
        Bind<ILocalStorage>((i) => SharedLocalStorageService()),
        Bind<ISession>((i) => SessionRepository()),
        Bind<ISubscriber>((i) => SubscriberRepository()),
        Bind((i) => AuthenticationController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
        Router('/authentication',
            module: AuthenticationModule(),
            transition: TransitionType.noTransition),
        Router('/home', module: HomeModule()),
        Router('/user', module: UserModule()),
        Router('/customer', child: (_, args) => CustomerPage()),
        Router('/serviceOrder', child: (_, args) => ServiceOrderPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
