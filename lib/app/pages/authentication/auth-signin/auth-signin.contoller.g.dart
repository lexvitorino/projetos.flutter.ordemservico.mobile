// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth-signin.contoller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthSigninController on _AuthSigninController, Store {
  final _$sessionModelAtom = Atom(name: '_AuthSigninController.sessionModel');

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

  final _$logInAsyncAction = AsyncAction('_AuthSigninController.logIn');

  @override
  Future<dynamic> logIn(String email, String password) {
    return _$logInAsyncAction.run(() => super.logIn(email, password));
  }

  final _$logOutAsyncAction = AsyncAction('_AuthSigninController.logOut');

  @override
  Future<dynamic> logOut() {
    return _$logOutAsyncAction.run(() => super.logOut());
  }

  @override
  String toString() {
    return '''
sessionModel: ${sessionModel}
    ''';
  }
}
