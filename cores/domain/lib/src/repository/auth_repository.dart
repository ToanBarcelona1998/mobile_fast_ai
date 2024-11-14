import 'package:domain/src/entity/auth_token.dart';
import 'package:domain/src/entity/requests/request.dart';

abstract interface class AuthRepository {
  Future<AuthToken> register({
    required RegisterRequest request,
  });

  Future<AuthToken> login({
    required LoginRequest request,
  });

  Future<bool> verifyEmail({
    required String token,
    required VerifyEmailRequest request,
  });

  Future<AuthToken> refreshToken({
    required RefreshTokenRequest request,
  });
}
