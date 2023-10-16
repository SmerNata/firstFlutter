import 'package:mobx/mobx.dart';
import '../models/dio.dart';
import '../models/user.dart';
part 'user_view_model.g.dart';
class UserViewModel = _UserViewModelBase with _$UserViewModel;

abstract class _UserViewModelBase with Store {
  @observable
  bool isLoading = true;
  @observable
  User? user;
  @action
  void changeLoading() {
    isLoading = !isLoading;
  }
  @action
  Future<void> getUser(String id) async {
    changeLoading();
    final DioRequest dioRequest = DioRequest();
    user = await dioRequest.getUser(id: id);
    changeLoading();
  }
}