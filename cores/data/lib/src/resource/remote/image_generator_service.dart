import 'package:data/core/base_response.dart';

abstract interface class ImageGeneratorService {
  Future<BaseResponse> generateImage({
    required String accessToken,
    required Map<String, dynamic> body,
  });

  Future<BaseResponse> enhancePrompt({
    required String accessToken,
    required Map<String, dynamic> body,
  });

  Future<BaseResponse> upscale({
    required String accessToken,
    required Map<String, dynamic> body,
  });

  Future<BaseResponse> removeBackground({
    required String accessToken,
    required Map<String, dynamic> body,
  });

  Future<BaseResponse> imageToText({
    required String accessToken,
    required Map<String, dynamic> body,
  });

  Future<BaseResponse> controlNetProcessor({
    required String accessToken,
    required Map<String, dynamic> body,
  });
}
