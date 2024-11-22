import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:flutter/material.dart';

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
    );
  }
}
