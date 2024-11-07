import 'package:domain/domain.dart';

extension UpdateUserRequestDto on UpdateUserRequest{
  Map<String,dynamic> toJson(){
    return {
      'user_name' : name,
      'phone_number' : phoneNumber,
      'birthday' : birthday,
      'address' : address,
      'avatar' : avatar,
      'status' : status,
      'gender' : gender,
    };
  }
}