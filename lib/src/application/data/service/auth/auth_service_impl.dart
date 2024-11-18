import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:mobile_fast_ai/src/application/data/service/api_service.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_service_impl.g.dart';

final class AuthServiceImpl implements AuthService {
  final AuthServiceGenerator _authServiceGenerator;

  const AuthServiceImpl(this._authServiceGenerator);

  @override
  Future<BaseResponse> login({
    required Map<String, dynamic> body,
  }) {
    return _authServiceGenerator.login(body);
  }

  @override
  Future<BaseResponse> register({
    required Map<String, dynamic> body,
  }) {
    return _authServiceGenerator.register(body);
  }

  @override
  Future<BaseResponse> refreshToken({required Map<String, dynamic> body}) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<BaseResponse> verifyEmail({required String token,required Map<String, dynamic> body}) {
    return _authServiceGenerator.verifyEmail(token,body);
  }

  @override
  Future<BaseResponse> completeOnboardingProfile({required String token, required Map<String, dynamic> body}) {
    return _authServiceGenerator.completeOnboardingProfile(token, body);
  }
}

@RestApi()
abstract class AuthServiceGenerator {
  factory AuthServiceGenerator(
    Dio dio, {
    String? baseUrl,
  }) = _AuthServiceGenerator;

  @POST(APIService.login)
  @MultiPart()
  Future<BaseResponse> login(@Part() Map<String, dynamic> body);

  @POST(APIService.register)
  @MultiPart()
  Future<BaseResponse> register(@Part() Map<String, dynamic> body);

  @POST(APIService.refreshToken)
  @MultiPart()
  Future<BaseResponse> refreshToken(@Part() Map<String, dynamic> body);

  @POST(APIService.registerVerifyEmail)
  @MultiPart()
  Future<BaseResponse> verifyEmail(
      @Header('Authorization') String accessToken,
    @Part() Map<String, dynamic> body,
  );

  @POST(APIService.registerCompleteProfile)
  @MultiPart()
  Future<BaseResponse> completeOnboardingProfile(
      @Header('Authorization') String accessToken,
    @Part() Map<String, dynamic> body,
  );
}
