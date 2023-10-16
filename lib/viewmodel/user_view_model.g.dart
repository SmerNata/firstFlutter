// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserViewModel on _UserViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_UserViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$userAtom =
      Atom(name: '_UserViewModelBase.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$getUserAsyncAction =
      AsyncAction('_UserViewModelBase.getUser', context: context);

  @override
  Future<void> getUser(String id) {
    return _$getUserAsyncAction.run(() => super.getUser(id));
  }

  late final _$_UserViewModelBaseActionController =
      ActionController(name: '_UserViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_UserViewModelBaseActionController.startAction(
        name: '_UserViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_UserViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
user: ${user}
    ''';
  }
}
