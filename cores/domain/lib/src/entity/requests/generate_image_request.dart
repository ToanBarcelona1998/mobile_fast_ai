import 'base_remote_request.dart';

final class GenerateImageRequest extends BaseRemoteRequest {
  final int? width;
  final int? height;
  final String model;
  final String prompt;
  final String? negativePrompt;
  final String? seedImage;
  final String? maskImage;
  final int? steps;
  final double? strength;
  final int? cfgScale;
  final int? clipSkip;
  final int number;

  const GenerateImageRequest({
    required this.model,
    required this.prompt,
    required super.accessToken,
    this.width,
    this.height,
    this.negativePrompt,
    this.cfgScale,
    this.clipSkip,
    this.maskImage,
    this.seedImage,
    this.steps,
    this.strength,
    this.number = 1,
  });
}
