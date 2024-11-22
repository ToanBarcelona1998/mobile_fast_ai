import 'package:freezed_annotation/freezed_annotation.dart';

part 'enhance_prompt_input_event.freezed.dart';

@freezed
class EnhancePromptInputEvent with _$EnhancePromptInputEvent {
  const factory EnhancePromptInputEvent.onChangePrompt(String prompt) =
      EnhancePromptInputEventOnChangePrompt;

  const factory EnhancePromptInputEvent.onSubmit() =
      EnhancePromptInputEventOnSubmit;
}
