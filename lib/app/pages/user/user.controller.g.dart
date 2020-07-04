// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserController, Store {
  final _$showSearchAtom = Atom(name: '_UserController.showSearch');

  @override
  bool get showSearch {
    _$showSearchAtom.reportRead();
    return super.showSearch;
  }

  @override
  set showSearch(bool value) {
    _$showSearchAtom.reportWrite(value, super.showSearch, () {
      super.showSearch = value;
    });
  }

  final _$usersAtom = Atom(name: '_UserController.users');

  @override
  ObservableList<UserModel> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableList<UserModel> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  final _$userModelAtom = Atom(name: '_UserController.userModel');

  @override
  UserModel get userModel {
    _$userModelAtom.reportRead();
    return super.userModel;
  }

  @override
  set userModel(UserModel value) {
    _$userModelAtom.reportWrite(value, super.userModel, () {
      super.userModel = value;
    });
  }

  final _$searchAsyncAction = AsyncAction('_UserController.search');

  @override
  Future search(String term) {
    return _$searchAsyncAction.run(() => super.search(term));
  }

  final _$getAsyncAction = AsyncAction('_UserController.get');

  @override
  Future<dynamic> get() {
    return _$getAsyncAction.run(() => super.get());
  }

  final _$getByIdAsyncAction = AsyncAction('_UserController.getById');

  @override
  Future<dynamic> getById(String id) {
    return _$getByIdAsyncAction.run(() => super.getById(id));
  }

  final _$_UserControllerActionController =
      ActionController(name: '_UserController');

  @override
  dynamic toggleSearch() {
    final _$actionInfo = _$_UserControllerActionController.startAction(
        name: '_UserController.toggleSearch');
    try {
      return super.toggleSearch();
    } finally {
      _$_UserControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<dynamic> save() {
    final _$actionInfo = _$_UserControllerActionController.startAction(
        name: '_UserController.save');
    try {
      return super.save();
    } finally {
      _$_UserControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showSearch: ${showSearch},
users: ${users},
userModel: ${userModel}
    ''';
  }
}
