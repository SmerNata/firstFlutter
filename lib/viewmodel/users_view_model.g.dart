// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UsersViewModel on UsersViewModelBase, Store {
  late final _$statusAtom =
      Atom(name: 'UsersViewModelBase.status', context: context);

  @override
  int? get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(int? value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$userListAtom =
      Atom(name: 'UsersViewModelBase.userList', context: context);

  @override
  List<User?> get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(List<User?> value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  late final _$getUsersAsyncAction =
      AsyncAction('UsersViewModelBase.getUsers', context: context);

  @override
  Future<void> getUsers() {
    return _$getUsersAsyncAction.run(() => super.getUsers());
  }

  @override
  String toString() {
    return '''
status: ${status},
userList: ${userList}
    ''';
  }
}
