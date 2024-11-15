import 'package:data/src/dto/dto.dart';
import 'package:data/src/resource/resource.dart';
import 'package:domain/domain.dart';

final class UploadRepositoryImpl implements UploadRepository {
  final UploadService _uploadService;

  const UploadRepositoryImpl(this._uploadService);

  @override
  Future<Upload> add({required UploadRequest request}) async {
    final baseResponse = await _uploadService.upload(
      request.accessToken,
      request.file,
    );

    final data = baseResponse.handleResponse();

    final UploadDto uploadDto = UploadDto.fromJson(data);

    return uploadDto.toEntity;
  }
}
