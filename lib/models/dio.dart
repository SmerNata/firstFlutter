import 'dart:io';

import 'package:dio/dio.dart';

import 'user.dart';
import 'new_user.dart';

class DioRequest {
  final Dio _dio = Dio();
  final _baseUrl = 'https://reqres.in/api';

  //get request
  Future<User?> getUser({required String id}) async {
    User? user;
    try {
      Response response = await _dio.get('$_baseUrl/users/$id');
      print('User Info: ${response.data}');
      user = User.fromJson(response.data["data"]);
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }
    return user;
  }
  Future<List<User?>> getUserList() async {
    List<User?> users = [];
    try {
      Response response = await _dio.get('$_baseUrl/users?page=1');
      print('User Info: ${response.data}');
      if (response.statusCode == HttpStatus.ok) {
        final responseData = response.data['data'];
        if (responseData is List) {
          users = responseData.map((e) => User.fromJson(e)).toList();
        }
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        print('Error sending request!');
        print(e.message);
      }
    }
    return users;
  }
  Future<NewUser?> createUser({required NewUser newUser}) async {
    NewUser? retrievedUser;

    try {
      Response response = await _dio.post(
        '$_baseUrl/users',
        data: newUser.toJson(),
      );

      print('User created: ${response.data}');

      retrievedUser = NewUser.fromJson(response.data);
    } catch (e) {
      print('Error creating user: $e');
    }

    return retrievedUser;
  }
}