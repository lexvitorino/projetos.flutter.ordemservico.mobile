// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth-signup.contoller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthSignupController on _AuthSignupController, Store {
  final _$subscriberModelAtom =
      Atom(name: '_AuthSignupController.subscriberModel');

  @override
  SubscriberModel get subscriberModel {
    _$subscriberModelAtom.reportRead();
    return super.subscriberModel;
  }

  @override
  set subscriberModel(SubscriberModel value) {
    _$subscriberModelAtom.reportWrite(value, super.subscriberModel, () {
      super.subscriberModel = value;
    });
  }

  final _$errorModelAtom = Atom(name: '_AuthSignupController.errorModel');

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

  final _$signUpAsyncAction = AsyncAction('_AuthSignupController.signUp');

  @override
  Future<dynamic> signUp(
      String name, String email, String password, String repassword) {
    return _$signUpAsyncAction
        .run(() => super.signUp(name, email, password, repassword));
  }

  @override
  String toString() {
    return '''
subscriberModel: ${subscriberModel},
errorModel: ${errorModel}
    ''';
  }
}
