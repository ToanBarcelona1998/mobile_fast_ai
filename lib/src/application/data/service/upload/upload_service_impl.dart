import 'dart:io';

import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:mobile_fast_ai/src/application/data/service/api_service.dart';
import 'package:retrofit/retrofit.dart';

part 'upload_service_impl.g.dart';

final class UploadServiceImpl implements UploadService {
  final UploadServiceGenerator _uploadServiceGenerator;

  const UploadServiceImpl(this._uploadServiceGenerator);

  @override
  Future<BaseResponse> upload(String accessToken, File file) {
    return _uploadServiceGenerator.upload(accessToken, file);
  }
}

@RestApi()
abstract class UploadServiceGenerator {
  factory UploadServiceGenerator(
    Dio dio, {
    String? baseUrl,
  }) = _UploadServiceGenerator;

  @POST(APIService.upload)
  @MultiPart()
  Future<BaseResponse> upload(
    @Header('Authorization') String accessToken,
    @Part(name: 'file') File file,
  );
}
