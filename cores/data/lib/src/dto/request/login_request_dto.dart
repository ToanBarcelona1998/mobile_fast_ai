import 'package:domain/domain.dart';

extension LoginRequestDto on LoginRequest{
  Map<String,dynamic> toJson(){
    return {
      'user_name' : userName,
      'password' : password
    };
  }
}