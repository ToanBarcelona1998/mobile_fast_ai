import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_generator_event.freezed.dart';

@freezed
class ImageGeneratorEvent with _$ImageGeneratorEvent{
  const factory ImageGeneratorEvent.onPromptChange(String prompt) = ImageGeneratorEventOnChangePrompt;
  const factory ImageGeneratorEvent.onNegativePromptChange(String prompt) = ImageGeneratorEventOnChangeNegativePrompt;
  const factory ImageGeneratorEvent.onRatioChange(int ratio) = ImageGeneratorEventOnChangeRatio;
  const factory ImageGeneratorEvent.onModelChange(int modelId) = ImageGeneratorEventOnSelectModel;
  const factory ImageGeneratorEvent.onCFGScaleChange(double scfScale) = ImageGeneratorEventOnCFGScaleChange;
  const factory ImageGeneratorEvent.onInit() = ImageGeneratorEventOnInit;
  const factory ImageGeneratorEvent.onSubmit() = ImageGeneratorEventOnSubmit;
}