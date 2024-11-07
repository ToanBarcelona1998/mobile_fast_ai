import 'package:domain/src/entity/entity.dart';

abstract interface class UserRepository {
  Future<User> get({required String accessToken,});

  Future<bool> update({
    required UpdateUserRequest request,
    required String accessToken,
  });
}
