import 'package:domain/core/exception/exception_handler.dart';
import 'package:domain/src/entity/entity.dart';
import 'package:domain/src/repository/repository.dart';
import 'package:domain/src/utils/token_management.dart';

final class ModelUseCase {
  final SecureLocalStorageRepository _secureLocalStorageRepository;
  final ModelRepository _modelRepository;

  const ModelUseCase(this._modelRepository, this._secureLocalStorageRepository);

  Future<List<Model>> getAll() async {
    final String accessToken = await _getAccessToken();

    final GetAllModelRequest request = GetAllModelRequest(
      accessToken: accessToken,
    );

    return ErrorHandler.getInstance().call(
      request: _modelRepository.getAll(
        parameter: request,
      ),
    );
  }

  Future<String> _getAccessToken() async {
    final TokenManagement tokenManagement =
        TokenManagement(_secureLocalStorageRepository);

    return ErrorHandler.getInstance().call(
      request: tokenManagement.getBearerToken(),
    );
  }
}
