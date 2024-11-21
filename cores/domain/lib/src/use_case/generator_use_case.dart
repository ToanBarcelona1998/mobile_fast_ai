import 'dart:io';

import 'package:domain/core/core.dart';
import 'package:domain/src/entity/entity.dart';
import 'package:domain/src/repository/repository.dart';
import 'package:domain/src/utils/token_management.dart';
import 'package:domain/src/utils/validate_base64.dart';

final class GeneratorUseCase {
  final SecureLocalStorageRepository _secureLocalStorageRepository;
  final ImageGeneratorRepository _imageGeneratorRepository;

  const GeneratorUseCase(
      this._imageGeneratorRepository, this._secureLocalStorageRepository);

  Future<List<AITask>> generatesImage({
    required String model,
    required String prompt,
    String? negativePrompt,
    String? maskImage,
    String? seedImage,
    int? height,
    int? width,
    int number = 1,
    double? strength,
    int? steps,
    int? clipSkip,
    double? cfgScale,
  }) async {
    final String accessToken = await _getAccessToken();

    final GenerateImageRequest request = GenerateImageRequest(
      model: model,
      prompt: prompt,
      accessToken: accessToken,
      negativePrompt: negativePrompt,
      height: height,
      width: width,
      number: number,
      strength: strength,
      steps: steps,
      clipSkip: clipSkip,
      cfgScale: cfgScale,
      maskImage: maskImage,
      seedImage: seedImage,
    );

    return ErrorHandler.getInstance().call(
      request: _imageGeneratorRepository.generateImage(request),
    );
  }

  Future<List<AITask>> upScaleImage({
    required File image,
    required int scaleFactor,
  }) async {
    final String accessToken = await _getAccessToken();

    final UpScaleImageRequest request = UpScaleImageRequest(
      image: image,
      scaleFactor: scaleFactor,
      accessToken: accessToken,
    );

    return ErrorHandler.getInstance().call(
      request: _imageGeneratorRepository.upscale(
        request,
      ),
    );
  }

  Future<List<AITask>> removeBackground({required File image}) async {
    final String accessToken = await _getAccessToken();

    final RemoveBackgroundRequest request = RemoveBackgroundRequest(
      image: image,
      accessToken: accessToken,
    );

    return ErrorHandler.getInstance().call(
      request: _imageGeneratorRepository.removeBackground(request),
    );
  }

  Future<List<AITask>> enhancePrompt({
    required String prompt,
    int? maxLength,
  }) async {
    final String accessToken = await _getAccessToken();

    final EnhancePromptRequest request = EnhancePromptRequest(
      prompt: prompt,
      accessToken: accessToken,
      maxLength: maxLength,
    );

    return ErrorHandler.getInstance().call(
      request: _imageGeneratorRepository.enhancePrompt(
        request,
      ),
    );
  }

  Future<List<AITask>> imageToText({required File image}) async {
    final String accessToken = await _getAccessToken();

    final ImageToTextRequest request = ImageToTextRequest(
      image: image,
      accessToken: accessToken,
    );

    return ErrorHandler.getInstance().call(
      request: _imageGeneratorRepository.imageToText(
        request,
      ),
    );
  }

  Future<List<AITask>> controlNetProcessor({
    required String image,
    int? width,
    int? height,
    String? type,
  }) async {
    if (!image.base64Validate()) {
      throw const FastAIError(
          code: FastAIError.developerErrorCode,
          message: 'Image should be base64 format');
    }

    final String accessToken = await _getAccessToken();

    final ControlNetRequest request = ControlNetRequest(
      image: image,
      width: width,
      height: height,
      type: type,
      accessToken: accessToken,
    );

    return ErrorHandler.getInstance().call(
      request: _imageGeneratorRepository.controlNetProcessor(
        request,
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
