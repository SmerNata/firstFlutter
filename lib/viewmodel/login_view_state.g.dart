// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewState on _LoginViewState, Store {
  Computed<bool>? _$isSubmitComputed;

  @override
  bool get isSubmit =>
      (_$isSubmitComputed ??= Computed<bool>(() => super.isSubmit,
              name: '_LoginViewState.isSubmit'))
          .value;

  late final _$loginAtom =
      Atom(name: '_LoginViewState.login', context: context);

  @override
  String get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(String value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginViewState.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$_LoginViewStateActionController =
      ActionController(name: '_LoginViewState', context: context);

  @override
  void setLogin(String value) {
    final _$actionInfo = _$_LoginViewStateActionController.startAction(
        name: '_LoginViewState.setLogin');
    try {
      return super.setLogin(value);
    } finally {
      _$_LoginViewStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_LoginViewStateActionController.startAction(
        name: '_LoginViewState.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginViewStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateLogin(String value) {
    final _$actionInfo = _$_LoginViewStateActionController.startAction(
        name: '_LoginViewState.validateLogin');
    try {
      return super.validateLogin(value);
    } finally {
      _$_LoginViewStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_LoginViewStateActionController.startAction(
        name: '_LoginViewState.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_LoginViewStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
login: ${login},
password: ${password},
isSubmit: ${isSubmit}
    ''';
  }
}
