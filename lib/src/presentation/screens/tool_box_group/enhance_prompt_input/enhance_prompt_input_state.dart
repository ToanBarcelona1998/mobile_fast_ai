import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'enhance_prompt_input_state.freezed.dart';

enum EnhancePromptInputStatus {
  none,
  generating,
  generated,
  failed,
}

@freezed
class EnhancePromptInputState with _$EnhancePromptInputState {
  const factory EnhancePromptInputState({
    @Default(EnhancePromptInputStatus.none) EnhancePromptInputStatus status,
    String ?error,
    @Default(false) bool isReadySubmit,
    @Default([]) List<AITask> tasks,
    @Default('') String prompt,
  }) = _EnhancePromptInputState;
}
