import '../models/api_response.dart';
import '../models/new_user.dart';
import '../models/user.dart';
import 'base_http_service.dart';

class UserService extends BaseHttpService {

  Future<ApiResponse> getUser(String id) async {
    final result = await dio
      .get(getFullURL('users/$id'))
      .then((response) {
        return response.statusCode == 200
          ? ApiResponse.fromParsed(
              true, UserResponse.fromJson(response.data))
          : ApiResponse.genericError(BaseHttpService.unhandledErrorText);
      }).catchError((error) => handleError(error));

    return result;
  }
  Future<ApiResponse> getUserList() async {
    final result = await dio
        .get(getFullURL('users?delay=2'))
        .then((response) {
      return response.statusCode == 200
          ? ApiResponse.fromParsed(
              true, UserListResponse.fromJson(response.data))
          : ApiResponse.genericError(BaseHttpService.unhandledErrorText);
    }).catchError((error) => handleError(error));

    return result;
  }
  Future<ApiResponse> createUser({required NewUser newUser}) async {
    final result = await dio.post(getFullURL('users'),
        data: newUser.toJson()
        ).then((response) {
      return response.statusCode == 201
          ? ApiResponse.fromParsed(
              true, NewUserResponse.fromJson(response.data))
          : ApiResponse.genericError(BaseHttpService.unhandledErrorText);
    }).catchError((error) => handleError(error));

    return result;
  }
}
