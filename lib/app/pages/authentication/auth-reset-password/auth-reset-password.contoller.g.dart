// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth-reset-password.contoller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthResetPasswordController on _AuthResetPasswordController, Store {
  final _$sessionModelAtom =
      Atom(name: '_AuthResetPasswordController.sessionModel');

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

  final _$errorModelAtom =
      Atom(name: '_AuthResetPasswordController.errorModel');

  @override
  ErrorModel get errorModel {
    _$errorModelAtom.reportRead();
    return super.errorModel;
  }

  @override
  set errorModel(ErrorModel value) {
    _$errorModelAtom.reportWrite(value, super.errorModel, () {
      super.errorModel = value;
    });
  }

  final _$resetPasswordAsyncAction =
      AsyncAction('_AuthResetPasswordController.resetPassword');

  @override
  Future<dynamic> resetPassword(String email) {
    return _$resetPasswordAsyncAction.run(() => super.resetPassword(email));
  }

  @override
  String toString() {
    return '''
sessionModel: ${sessionModel},
errorModel: ${errorModel}
    ''';
  }
}
