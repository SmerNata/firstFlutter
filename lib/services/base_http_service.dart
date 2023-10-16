import 'package:dio/dio.dart';

import '../models/api_response.dart';

class BaseHttpService {
  static const authHeader = 'Authorization';

  static const unhandledErrorText = 'Необработанная ошибка';

  final dio = Dio();

  final String baseUrl = 'https://reqres.in/api/';

  String getFullURL(String uri) {
    return '$baseUrl$uri';
  }

  ApiResponse handleError(error) {
    String errorText = 'SERVER_ERROR';
    switch (error.response?.statusCode) {
      case 400:
          return ApiResponse.fromJson(error.response.data);
      case 404:
          errorText = 'DATA_NOT_FOUND';
        break;
    }
    return ApiResponse.genericError(errorText);
  }
}