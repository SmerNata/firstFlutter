import 'package:mobx/mobx.dart';
import 'package:test_app/viewmodel/login_error_state.dart';
import 'package:validators/validators.dart';

part 'login_view_state.g.dart';

// ignore: library_private_types_in_public_api
class LoginViewState = _LoginViewState with _$LoginViewState;

abstract class _LoginViewState with Store {
  final LoginErrorState error = LoginErrorState();
  @observable
  String login = '';
  @observable
  String password = '';
  @computed
  bool get isSubmit {
    bool result = !error.hasErrors;
    List required = [login, password];
    if (result) {
      for(int i=0; i < required.length; i++){
        if (required[i] == '') {
          result = false;
          break;
        }
      }
    }
    return result;
  }
  @action
  void setLogin(String value) {
    login = value;
    validateLogin(login);
  }

  @action
  void setPassword(String value) {
    password = value;
    validatePassword(password);
  }
  @action
  void validateLogin(String value) {
    if (isNull(value) || value.isEmpty) {
      error.login = 'NULL_VALUE';
    } else {
      error.login = isEmail(value) ? null : 'FORMAT_ERROR';
    }
  }
  @action
  void validatePassword(String value) {
    error.password = isNull(value) || value.isEmpty ? 'NULL_VALUE' : null;
  }
}