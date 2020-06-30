// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthenticationController on _AuthenticationControllerBase, Store {
  final _$statusAtom = Atom(name: '_AuthenticationControllerBase.status');

  @override
  AuthStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(AuthStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$sessionModelAtom =
      Atom(name: '_AuthenticationControllerBase.sessionModel');

  @override
  SessionModel get sessionModel {
    _$sessionModelAtom.reportRead();
    return super.sessionModel;
  }

  @override
  set sessionModel(SessionModel value) {
    _$sessionModelAtom.reportWrite(value, super.sessionModel, () {
      super.sessionModel = value;
    });
  }

  final _$logInAsyncAction = AsyncAction('_AuthenticationControllerBase.logIn');

  @override
  Future<dynamic> logIn(String email, String password) {
    return _$logInAsyncAction.run(() => super.logIn(email, password));
  }

  final _$logOutAsyncAction =
      AsyncAction('_AuthenticationControllerBase.logOut');

  @override
  Future<dynamic> logOut() {
    return _$logOutAsyncAction.run(() => super.logOut());
  }

  final _$_AuthenticationControllerBaseActionController =
      ActionController(name: '_AuthenticationControllerBase');

  @override
  dynamic setToken(SessionModel value) {
    final _$actionInfo = _$_AuthenticationControllerBaseActionController
        .startAction(name: '_AuthenticationControllerBase.setToken');
    try {
      return super.setToken(value);
    } finally {
      _$_AuthenticationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
sessionModel: ${sessionModel}
    ''';
  }
}
