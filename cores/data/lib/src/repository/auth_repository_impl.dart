import 'package:data/src/dto/request/request_dto.dart';
import 'package:data/src/resource/remote/remote.dart';
import 'package:domain/domain.dart';

final class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  const AuthRepositoryImpl(this._authService);

  @override
  Future<String> login({required LoginRequest request}) async {
    final baseResponse = await _authService.login(
      body: request.toJson(),
    );

    final loginResponse = baseResponse.handleResponse();

    return loginResponse!.accessToken;
  }

  @override
  Future<String> register({required RegisterRequest request}) async{
    final baseResponse = await _authService.register(
      body: request.toJson(),
    );

    final registerResponse = baseResponse.handleResponse();

    return registerResponse!.accessToken;
  }
}
