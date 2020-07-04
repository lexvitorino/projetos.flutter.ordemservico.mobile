import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/home/home.controller.dart';
import 'package:osmobile/app/pages/home/home.page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
