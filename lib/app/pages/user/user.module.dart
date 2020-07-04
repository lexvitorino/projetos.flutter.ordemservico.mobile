import 'package:flutter_modular/flutter_modular.dart';
import 'package:osmobile/app/pages/user/pages/user-detail/user-detail.page.dart';
import 'package:osmobile/app/pages/user/pages/user-edit/user-edit.page.dart';
import 'package:osmobile/app/pages/user/pages/user/user.page.dart';
import 'package:osmobile/app/pages/user/repositories/interfaces/user.interface.dart';
import 'package:osmobile/app/pages/user/repositories/user.repository.dart';
import 'package:osmobile/app/pages/user/user.controller.dart';

class UserModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => UserController()),
        Bind<IUser>((i) => UserRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => UserPage()),
        Router('/detail/:id',
            child: (_, args) => UserDetailPage(id: args.params['id'])),
        Router('/edit/:id',
            child: (_, args) => UserEditPage(id: args.params['id'])),
        Router('/create', child: (_, args) => UserEditPage(id: null)),
      ];

  static Inject get to => Inject<UserModule>.of();
}
