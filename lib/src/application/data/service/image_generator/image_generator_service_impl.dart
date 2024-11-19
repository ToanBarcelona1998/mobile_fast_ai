import 'package:data/data.dart';
import 'package:dio/dio.dart';
import 'package:mobile_fast_ai/src/application/data/service/api_service.dart';
import 'package:retrofit/retrofit.dart';

part 'image_generator_service_impl.g.dart';

final class ImageGeneratorServiceImpl implements ImageGeneratorService {
  final ImageGeneratorServiceGenerator _serviceGenerator;

  const ImageGeneratorServiceImpl(this._serviceGenerator);

  @override
  Future<BaseResponse> controlNetProcessor(
      {required String accessToken, required Map<String, dynamic> body}) {
    return _serviceGenerator.controlNetProcessor(accessToken, body);
  }

  @override
  Future<BaseResponse> enhancePrompt(
      {required String accessToken, required Map<String, dynamic> body}) {
    return _serviceGenerator.enhancePrompt(accessToken, body);
  }

  @override
  Future<BaseResponse> generateImage(
      {required String accessToken, required Map<String, dynamic> body}) {
    return _serviceGenerator.generateImage(accessToken, body);
  }

  @override
  Future<BaseResponse> imageToText(
      {required String accessToken, required Map<String, dynamic> body}) {
    return _serviceGenerator.imageToText(accessToken, body);
  }

  @override
  Future<BaseResponse> removeBackground(
      {required String accessToken, required Map<String, dynamic> body}) {
    return _serviceGenerator.removeBackground(accessToken, body);
  }

  @override
  Future<BaseResponse> upscale(
      {required String accessToken, required Map<String, dynamic> body}) {
    return _serviceGenerator.upscale(accessToken, body);
  }
}

@RestApi()
abstract class ImageGeneratorServiceGenerator {
  factory ImageGeneratorServiceGenerator(
    Dio dio, {
    String? baseUrl,
  }) = _ImageGeneratorServiceGenerator;

  @POST(APIService.controlNet)
  @MultiPart()
  Future<BaseResponse> controlNetProcessor(
    @Header('Authorization') String accessToken,
    @Part() Map<String, dynamic> body,
  );

  @POST(APIService.enhancePrompt)
  Future<BaseResponse> enhancePrompt(
    @Header('Authorization') String accessToken,
    @Part() Map<String, dynamic> body,
  );

  @POST(APIService.generateImages)
  Future<BaseResponse> generateImage(
    @Header('Authorization') String accessToken,
    @Part() Map<String, dynamic> body,
  );

  @POST(APIService.imageToText)
  Future<BaseResponse> imageToText(
    @Header('Authorization') String accessToken,
    @Part() Map<String, dynamic> body,
  );

  @POST(APIService.removeBackground)
  Future<BaseResponse> removeBackground(
    @Header('Authorization') String accessToken,
    @Part() Map<String, dynamic> body,
  );

  @POST(APIService.upscale)
  Future<BaseResponse> upscale(
    @Header('Authorization') String accessToken,
    @Part() Map<String, dynamic> body,
  );
}
