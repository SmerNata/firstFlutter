import 'response_error.dart';

class ApiResponse {
  final bool status;
  late final data;
  final List<ErrorData>? errors;
  final String? genericError;

  ApiResponse({
    required this.status,
    this.data,
    this.errors,
    this.genericError,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    final list = json['errors'] != null ? json['errors'] as List : null;

    return ApiResponse(
      status: json['status'],
      errors: list?.map((e) => ErrorData.fromJson(e)).toList(),
    );
  }

  factory ApiResponse.genericError(String? errorString) {
    return ApiResponse(status: false, genericError: errorString);
  }

  factory ApiResponse.fromParsed(bool status, dynamic data) {
    return ApiResponse(status: status, data: data);
  }

  String get singleErrorText {
    if (genericError != null) {
      return genericError as String;
    }

    if (errors != null) {
      String errorCompiled = '';
      errors!.forEach((element) {
        errorCompiled = '$errorCompiled  ${element.message}';
      });
      return errorCompiled;
    }

    return '';
  }
}