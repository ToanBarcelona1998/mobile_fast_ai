import 'package:domain/core/core.dart';

final class BaseResponse<T> {
  final T? data;
  final String message;
  final int code;

  const BaseResponse({
    required this.message,
    this.data,
    required this.code,
  });

  T? handleResponse() {
    if (code == 200) {
      return data;
    }
    throw FastAIError(
      code: code,
      message: message,
    );
  }

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
        message: json['message'], code: json['code'], data: json['data']);
  }
}
