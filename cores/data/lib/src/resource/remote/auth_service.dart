import 'package:data/core/base_response.dart';

abstract interface class AuthService {
  Future<BaseResponse> login({
    required Map<String, dynamic> body,
  });

  Future<BaseResponse> register({
    required Map<String, dynamic> body,
  });
}
