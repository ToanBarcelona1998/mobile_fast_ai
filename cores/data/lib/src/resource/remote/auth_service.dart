import 'package:data/core/base_response.dart';
import 'response/response.dart';

abstract interface class AuthService {
  Future<BaseResponse<LoginResponse>> login({
    required Map<String, dynamic> body,
  });

  Future<BaseResponse<RegisterResponse>> register({
    required Map<String, dynamic> body,
  });
}
