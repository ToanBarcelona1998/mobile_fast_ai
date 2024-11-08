import 'package:domain/core/core.dart';
import 'package:domain/src/entity/entity.dart';
import 'package:domain/src/repository/repository.dart';
import 'package:domain/src/utils/token_management.dart';

final class UserUseCase {
  final UserRepository _userRepository;
  final SecureLocalStorageRepository _secureLocalStorageRepository;

  const UserUseCase(this._userRepository, this._secureLocalStorageRepository);

  Future<User> getUser() async {
    final TokenManagement tokenManagement = TokenManagement(_secureLocalStorageRepository);
    final String accessToken = await ErrorHandler.getInstance().call(
      request: tokenManagement.getBearerToken(),
    );

    return ErrorHandler.getInstance().call(
      request: _userRepository.get(
        accessToken: accessToken,
      ),
    );
  }

  Future<void> update({
    required String userName,
    required int gender,
    required int status,
  }) async {
    final TokenManagement tokenManagement = TokenManagement(_secureLocalStorageRepository);
    final String accessToken = await ErrorHandler.getInstance().call(
      request: tokenManagement.getBearerToken(),
    );

    final UpdateUserRequest updateUserRequest = UpdateUserRequest(
      name: userName,
      gender: gender,
      status: status,
    );

    await ErrorHandler.getInstance().call(
      request: _userRepository.update(
        request: updateUserRequest,
        accessToken: accessToken,
      ),
    );
  }
}
