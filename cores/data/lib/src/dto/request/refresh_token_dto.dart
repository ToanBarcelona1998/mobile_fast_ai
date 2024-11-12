import 'package:domain/domain.dart';

extension RefreshTokenRequestDto on RefreshTokenRequest{
  Map<String,dynamic> toJson(){
    return {
      'refresh_token' : refreshToken,
    };
  }
}