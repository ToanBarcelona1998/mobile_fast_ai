import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:mobile_fast_ai/src/application/data/service/api_service.dart';
import 'package:retrofit/retrofit.dart';

part 'user_service_impl.g.dart';

final class UserServiceImpl implements UserService {
  final UserServiceGenerator _userServiceGenerator;

  const UserServiceImpl(this._userServiceGenerator);

  @override
  Future<BaseResponse> get({required String accessToken,}) {
    return _userServiceGenerator.get(accessToken);
  }

  @override
  Future<BaseResponse> update(Map<String, dynamic> json,{required String accessToken,}) {
    return _userServiceGenerator.update(accessToken,json);
  }
}

@RestApi()
abstract class UserServiceGenerator {
  factory UserServiceGenerator(Dio dio, {String? baseUrl}) =
      _UserServiceGenerator;

  @GET(APIService.getUser)
  Future<BaseResponse> get(@Header('Authorization') String accessToken);

  @PUT(APIService.updateUser)
  @MultiPart()
  Future<BaseResponse> update(@Header('Authorization') String accessToken,@Part() Map<String, dynamic> json);
}
