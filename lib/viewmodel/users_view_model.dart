import 'package:mobx/mobx.dart';

import '../models/user.dart';
import '../services/user_service.dart';

part 'users_view_model.g.dart';

class UsersViewModel = UsersViewModelBase with _$UsersViewModel;

abstract class UsersViewModelBase with Store {
  @observable
  int? status;
  @observable
  List<User?> userList = [];
  final UserService _userService = UserService();
  UserListResponse? userListResponse;
  @action
  Future<void> getUsers() async {
    status = 0;
    var result = await _userService.getUserList();
    if (result.status) {
      userListResponse = result.data;
      userList = userListResponse!.data;
    } else {
      userList = [];
    }
    status = 1;
  }
}