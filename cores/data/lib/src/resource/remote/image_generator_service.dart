import 'dart:io';

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
    required File file,
  });

  Future<BaseResponse> removeBackground({
    required String accessToken,
    required Map<String, dynamic> body,
    required File file,
  });

  Future<BaseResponse> imageToText({
    required String accessToken,
    required Map<String, dynamic> body,
    required File file,
  });

  Future<BaseResponse> controlNetProcessor({
    required String accessToken,
    required Map<String, dynamic> body,
  });
}
