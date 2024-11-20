import 'dart:convert';

import 'package:domain/core/core.dart';
import 'package:domain/src/constant.dart';
import 'package:domain/src/entity/entity.dart';
import 'package:domain/src/repository/repository.dart';
import 'package:domain/src/utils/token_management.dart';

final class UserUseCase {
  final UserRepository _userRepository;
  final SecureLocalStorageRepository _secureLocalStorageRepository;
  final NormalLocalStorageRepository _normalLocalStorageRepository;

  const UserUseCase(this._userRepository, this._secureLocalStorageRepository,
      this._normalLocalStorageRepository);

  Future<User> getUser() async {
    final TokenManagement tokenManagement =
        TokenManagement(_secureLocalStorageRepository);
    final String accessToken = await ErrorHandler.getInstance().call(
      request: tokenManagement.getBearerToken(),
    );

    final user = await ErrorHandler.getInstance().call(
      request: _userRepository.get(
        accessToken: accessToken,
      ),
    );

    final encodedUser = jsonEncode(
      user.toJson(),
    );

    final AddLocalStorageRequest addUserRequest = AddLocalStorageRequest(
      value: encodedUser,
      key: userKey,
    );

    await _normalLocalStorageRepository.add(
      request: addUserRequest,
    );

    return user;
  }

  Future<void> update({
    required String userName,
    required int gender,
    required int status,
  }) async {
    final TokenManagement tokenManagement =
        TokenManagement(_secureLocalStorageRepository);
    final String accessToken = await ErrorHandler.getInstance().call(
      request: tokenManagement.getBearerToken(),
    );

    final UpdateUserRequest updateUserRequest = UpdateUserRequest(
      name: userName,
      gender: gender,
      accessToken: accessToken,
    );

    await ErrorHandler.getInstance().call(
      request: _userRepository.update(
        request: updateUserRequest,
      ),
    );
  }

  Future<User?> getStorageUser() async {
    final encodedUser = await _normalLocalStorageRepository.get(id: userKey);

    if (encodedUser == null) return null;

    final decodedUser = jsonDecode(encodedUser);

    return User.fromJson(decodedUser);
  }
}
