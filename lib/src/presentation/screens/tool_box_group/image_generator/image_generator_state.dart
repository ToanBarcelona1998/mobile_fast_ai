import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_generator_state.freezed.dart';

enum ImageGeneratorStatus {
  none,
  generating,
  generated,
  failed,
}

enum ImageGeneratorScreenStatus{
  none,
  loading,
  loaded,
  error,
}

@freezed
class ImageGeneratorState with _$ImageGeneratorState {
  const factory ImageGeneratorState({
    @Default(ImageGeneratorStatus.none) ImageGeneratorStatus status,
    @Default(ImageGeneratorScreenStatus.none) ImageGeneratorScreenStatus screenStatus,
    String ?error,
    @Default('') String prompt,
    String? negativePrompt,
    @Default(7) double cfgScale,
    @Default([]) List<Model> models,
    Model ?selectedModel,
    String ?seedImage,
    @Default(1) int ratio,
    @Default([]) List<AITask> completedTasks,
    @Default(false) bool isReadySubmit
  }) = _ImageGeneratorState;
}
