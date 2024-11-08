import 'package:domain/core/core.dart';
import 'package:domain/src/entity/requests/request.dart';
import 'package:domain/src/repository/repository.dart';
import 'package:domain/src/utils/token_management.dart';

final class AuthUseCase {
  final AuthRepository _authRepository;
  final SecureLocalStorageRepository _secureLocalStorageRepository;

  const AuthUseCase(this._secureLocalStorageRepository, this._authRepository);

  Future<void> login(String userName, String password) async {
    final LoginRequest request =
        LoginRequest(userName: userName, password: password);

    final String accessToken = await ErrorHandler.getInstance().call<String>(
      request: _authRepository.login(request: request),
    );

    final TokenManagement tokenManagement = TokenManagement(_secureLocalStorageRepository);

    await ErrorHandler.getInstance().call(
      request: tokenManagement.saveToken(
        accessToken,
      ),
    );
  }

  Future<void> register(String userName, String password) async {
    final RegisterRequest request =
        RegisterRequest(userName: userName, password: password);

    final String accessToken = await ErrorHandler.getInstance().call<String>(
      request: _authRepository.register(request: request),
    );

    final TokenManagement tokenManagement = TokenManagement(_secureLocalStorageRepository);

    await ErrorHandler.getInstance().call(
      request: tokenManagement.saveToken(
        accessToken,
      ),
    );
  }
}
