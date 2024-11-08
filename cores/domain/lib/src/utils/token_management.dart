import 'package:domain/src/repository/repository.dart';
import 'package:domain/src/entity/requests/request.dart';

const String accessTokenKey = 'fast_ai_access_token_key';

final class TokenManagement {
  final SecureLocalStorageRepository _repository;

  TokenManagement(this._repository);

  Future<String> getBearerToken() async {
    final String? accessToken = await _repository.get(id: accessTokenKey);

    return 'Bearer $accessToken';
  }

  Future<void> saveToken(String token)async{
    final AddLocalStorageRequest addLocalStorageRequest =
    AddLocalStorageRequest(
      value: token,
      key: accessTokenKey,
    );
    await _repository.add(request: addLocalStorageRequest);
  }
}