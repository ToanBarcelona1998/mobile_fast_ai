import 'package:data/src/dto/dto.dart';
import 'package:data/src/dto/request/request_dto.dart';
import 'package:data/src/resource/remote/remote.dart';
import 'package:domain/domain.dart';

final class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  const AuthRepositoryImpl(this._authService);

  @override
  Future<AuthToken> login({required LoginRequest request}) async {
    final baseResponse = await _authService.login(
      body: request.toJson(),
    );

    final data = baseResponse.handleResponse();

    final AuthTokenDto authTokenDto = AuthTokenDto.fromJson(data);

    return authTokenDto.toEntity;
  }

  @override
  Future<AuthToken> register({required RegisterRequest request}) async {
    final baseResponse = await _authService.register(
      body: request.toJson(),
    );

    final data = baseResponse.handleResponse();

    final AuthTokenDto authTokenDto = AuthTokenDto.fromJson(data);

    return authTokenDto.toEntity;
  }

  @override
  Future<AuthToken> refreshToken({required RefreshTokenRequest request}) async {
    final baseResponse = await _authService.refreshToken(
      body: request.toJson(),
    );

    final data = baseResponse.handleResponse();

    final AuthTokenDto authTokenDto = AuthTokenDto.fromJson(data);

    return authTokenDto.toEntity;
  }

  @override
  Future<bool> verifyEmail({required VerifyEmailRequest request}) async {
    final baseResponse = await _authService.verifyEmail(
      body: request.toJson(),
    );

    return baseResponse.handleResponse();
  }
}
