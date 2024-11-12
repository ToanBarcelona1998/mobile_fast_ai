import 'package:domain/domain.dart';

extension VerifyEmailRequestDto on VerifyEmailRequest{
  Map<String,dynamic> toJson(){
    return {
      'otp' : otp,
      'email' : email
    };
  }
}