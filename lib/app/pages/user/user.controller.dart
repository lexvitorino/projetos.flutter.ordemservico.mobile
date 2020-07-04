import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:osmobile/app/pages/user/repositories/interfaces/user.interface.dart';
import 'package:osmobile/app/pages/user/repositories/user.repository.dart';
import 'package:osmobile/app/pages/user/user.model.dart';
import 'package:osmobile/app/shared/models/error.model.dart';

part 'user.controller.g.dart';

class UserController = _UserController with _$UserController;

abstract class _UserController with Store {
  final IUser _user = Modular.get<UserRepository>();
  final _usersList = new ObservableList<UserModel>();

  @observable
  bool showSearch = false;

  @observable
  ObservableList<UserModel> users = ObservableList<UserModel>();

  @observable
  UserModel userModel = UserModel();

  @observable
  ErrorModel errorModel;

  @action
  toggleSearch() {
    showSearch = !showSearch;
  }

  @action
  search(String term) async {
    users = _usersList;
  }

  @action
  Future get() async {
    _usersList.addAll(await _user.get());
    users = _usersList;
  }

  @action
  Future save() {
    if (userModel.id == null || userModel.id == 0) {
      return _user.create(userModel);
    } else {
      return _user.update(userModel);
    }
  }

  @action
  Future getById(String id) async {
    if (id != null) {
      userModel = await _user.getById(id);
      return userModel;
    } else {
      return userModel = UserModel();
    }
  }
}
