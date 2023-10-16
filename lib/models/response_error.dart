class ErrorData {
  final String code;
  final String message;

  const ErrorData({required this.code, required this.message});

  factory ErrorData.fromJson(Map<String, dynamic> json) {
    return ErrorData(code: json['code'], message: json['message']);
  }
}