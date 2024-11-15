import 'package:data/src/dto/dto.dart';
import 'package:data/src/resource/resource.dart';
import 'package:domain/domain.dart';

final class UserRepositoryImpl implements UserRepository {
  final UserService _userService;

  const UserRepositoryImpl(this._userService);

  @override
  Future<User> get({
    required String accessToken,
  }) async {
    final baseResponse = await _userService.get(accessToken: accessToken);

    final data = baseResponse.handleResponse();

    final UserDto userDto = UserDto.fromJson(data['user']);

    return userDto.toEntity;
  }

  @override
  Future<bool> update({
    required UpdateUserRequest request,
  }) async {
    final baseResponse = await _userService.update(
      request.toJson(),
      accessToken: request.accessToken,
    );

    final data = baseResponse.handleResponse();

    return data;
  }
}
