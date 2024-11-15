import 'dart:io';

import 'package:domain/core/core.dart';
import 'package:domain/src/entity/entity.dart';
import 'package:domain/src/repository/repository.dart';
import 'package:domain/src/utils/token_management.dart';

final class UploadUseCase {
  final UploadRepository _uploadRepository;
  final SecureLocalStorageRepository _secureLocalStorageRepository;

  const UploadUseCase(
      this._uploadRepository, this._secureLocalStorageRepository);

  Future<Upload> upload(String filePath) async {
    final TokenManagement tokenManagement =
        TokenManagement(_secureLocalStorageRepository);

    final String accessToken = await ErrorHandler.getInstance().call(
      request: tokenManagement.getBearerToken(),
    );

    final File file = File(filePath);

    final UploadRequest uploadRequest = UploadRequest(
      accessToken: accessToken,
      file: file,
    );

    return _uploadRepository.add(request: uploadRequest).whenComplete(
      () {
        if (file.existsSync()) {
          file.deleteSync();
        }
      },
    );
  }
}
