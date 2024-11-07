import 'package:data/core/base_response.dart';

abstract interface class UserService{
  Future<BaseResponse> get({required String accessToken,});

  Future<BaseResponse> update(Map<String,dynamic> json,{required String accessToken,});
}