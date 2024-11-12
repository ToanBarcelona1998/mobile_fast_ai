import 'package:domain/src/repository/repository.dart';
import 'package:domain/src/entity/requests/request.dart';

const String accessTokenKey = 'fast_ai_access_token_key';
const String refreshTokenKey = 'fast_ai_refresh_token_key';

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