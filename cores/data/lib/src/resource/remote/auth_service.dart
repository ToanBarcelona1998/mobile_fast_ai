import 'package:data/core/base_response.dart';

abstract interface class AuthService {
  Future<BaseResponse> login({
    required Map<String, dynamic> body,
  });

  Future<BaseResponse> register({
    required Map<String, dynamic> body,
  });

  Future<BaseResponse> verifyEmail({
    required String token,
    required Map<String, dynamic> body,
  });

  Future<BaseResponse> refreshToken({
    required Map<String, dynamic> body,
  });

  Future<BaseResponse> completeOnboardingProfile({
    required String token,
    required Map<String, dynamic> body,
  });
}
