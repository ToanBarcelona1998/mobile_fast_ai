import 'package:domain/src/constant.dart';
import 'package:domain/src/repository/repository.dart';
import 'package:domain/src/entity/requests/request.dart';

final class TokenManagement {
  final SecureLocalStorageRepository _repository;

  TokenManagement(this._repository);

  Future<String> getBearerToken() async {
    final String? accessToken = await _repository.get(id: accessTokenKey);

    return 'Bearer $accessToken';
  }

  Future<void> _saveToken(String token, String key)async{
    final AddLocalStorageRequest addLocalStorageRequest =
    AddLocalStorageRequest(
      value: token,
      key: key,
    );
    await _repository.add(request: addLocalStorageRequest);
  }

  Future<void> saveToken(String token)async{
    return _saveToken(token,accessTokenKey);
  }

  Future<void> saveRefreshToken(String token)async{
    return _saveToken(token,refreshTokenKey);
  }
}