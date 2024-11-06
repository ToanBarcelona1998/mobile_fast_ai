import 'package:domain/domain.dart';

extension RegisterRequestDto on RegisterRequest{
  Map<String,dynamic> toJson(){
    return {
      'user_name' : userName,
      'password' : password
    };
  }
}