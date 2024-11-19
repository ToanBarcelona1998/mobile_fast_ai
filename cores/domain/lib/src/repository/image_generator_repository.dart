import 'package:domain/src/entity/entity.dart';

abstract interface class ImageGeneratorRepository {
  Future<List<AITask>> generateImage(
    GenerateImageRequest request,
  );

  Future<List<AITask>> enhancePrompt(
    EnhancePromptRequest request,
  );

  Future<List<AITask>> upscale(
    UpScaleImageRequest request,
  );

  Future<List<AITask>> removeBackground(
    RemoveBackgroundRequest request,
  );

  Future<List<AITask>> imageToText(
    ImageToTextRequest request,
  );

  Future<List<AITask>> controlNetProcessor(
    ControlNetRequest request,
  );
}
