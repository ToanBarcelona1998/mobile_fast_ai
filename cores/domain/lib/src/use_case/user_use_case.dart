import 'package:domain/core/constant.dart';
import 'package:domain/core/core.dart';
import 'package:domain/src/entity/entity.dart';
import 'package:domain/src/repository/repository.dart';

final class UserUseCase {
  final UserRepository _userRepository;
  final SecureLocalStorageRepository _secureLocalStorageRepository;

  const UserUseCase(this._userRepository, this._secureLocalStorageRepository);

  Future<User> getUser() async {
    final String? accessToken = await ErrorHandler.getInstance().call(
      request: _secureLocalStorageRepository.get(id: accessTokenKey),
    );

    return ErrorHandler.getInstance().call(
      request: _userRepository.get(
        accessToken: accessToken ?? '',
      ),
    );
  }

  Future<void> update({
    required String userName,
    required int gender,
    required int status,
  }) async {
    final String? accessToken = await ErrorHandler.getInstance().call(
      request: _secureLocalStorageRepository.get(id: accessTokenKey),
    );

    final UpdateUserRequest updateUserRequest = UpdateUserRequest(
      name: userName,
      gender: gender,
      status: status,
    );

    await ErrorHandler.getInstance().call(
      request: _userRepository.update(
        request: updateUserRequest,
        accessToken: accessToken ?? '',
      ),
    );
  }
}
