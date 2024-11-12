import 'package:domain/domain.dart';

extension AuthTokenDtoMapper on AuthTokenDto {
  AuthToken get toEntity => AuthToken(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
}

final class AuthTokenDto {
  final String accessToken;
  final String refreshToken;

  const AuthTokenDto({
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthTokenDto.fromJson(Map<String, dynamic> json) {
    return AuthTokenDto(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
