import 'package:domain/src/entity/requests/request.dart';

abstract interface class AuthRepository {
  Future<String> register({
    required RegisterRequest request,
  });

  Future<String> login({
    required LoginRequest request,
  });
}
