import 'package:domain/domain.dart';

extension GenerateImageRequestDto on GenerateImageRequest {
  Map<String, dynamic> toJson() {
    return {
      'width': width,
      'height': height,
      'model': model,
      'prompt': prompt,
      'negativePrompt': negativePrompt,
      'number': number,
      'CFGScale': cfgScale,
      'strength': strength,
      'seed_image': seedImage,
      'mask_image': maskImage,
      'steps': steps,
      'clipSkip': clipSkip
    }..removeWhere(
        (key, value) => value == null,
      );
  }
}
