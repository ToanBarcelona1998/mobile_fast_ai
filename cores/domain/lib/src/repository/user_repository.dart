import 'package:domain/src/entity/entity.dart';

abstract interface class UserRepository {
  Future<User> get();

  Future<bool> update({
    required UpdateUserRequest request,
  });
}
