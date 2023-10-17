import 'package:mobx/mobx.dart';

part 'login_error_state.g.dart';

// ignore: library_private_types_in_public_api
class LoginErrorState = _LoginErrorState with _$LoginErrorState;

abstract class _LoginErrorState with Store {
  @observable
  String? login;

  @observable
  String? password;

  @computed
  bool get hasErrors => login != null || password != null;
}