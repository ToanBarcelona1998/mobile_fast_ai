import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/enhance_prompt_input/enhance_prompt_input_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/enhance_prompt_input/enhance_prompt_input_event.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:flutter/material.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_manager.dart';

class EnhancePromptInputEnterPromptWidget extends StatelessWidget {
  final TextEditingController enterPromptController;
  final AppLocalizationManager localization;

  const EnhancePromptInputEnterPromptWidget({
    required this.enterPromptController,
    required this.localization,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextInputWithBoxFormWidget(
      boxConstraints: const BoxConstraints(
        maxHeight: BoxSize.boxSize16,
        minHeight: BoxSize.boxSize16,
      ),
      hintText: localization.translate(
        LanguageKey.enhancePromptInputScreenEnterPromptHint,
      ),
      controller: enterPromptController,
      label: localization.translate(
        LanguageKey.enhancePromptInputScreenEnterPrompt,
      ),
      constraintManager: ConstraintManager(isStopWhenFirstFailure: true)
        ..minLength(
          minLength: 2,
          errorMessage: localization.translate(
            LanguageKey.enhancePromptInputScreenPromptInvalid,
          ),
        )
        ..maxLength(
          maxLength: 2000,
          errorMessage: localization.translate(
            LanguageKey.enhancePromptInputScreenPromptInvalid,
          ),
        ),
      onChanged: (prompt, _) => _onChange(prompt, context),
    );
  }

  void _onChange(String prompt, BuildContext context) {
    EnhancePromptInputBloc.of(context).add(
      EnhancePromptInputEventOnChangePrompt(
        prompt,
      ),
    );
  }
}
