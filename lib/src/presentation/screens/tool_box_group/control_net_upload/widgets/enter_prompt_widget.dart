import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:flutter/material.dart';

class ControlNetUploadEnterPromptWidget extends StatelessWidget {
  final TextEditingController promptController;
  final AppLocalizationManager localization;

  const ControlNetUploadEnterPromptWidget({
    required this.promptController,
    required this.localization,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextInputWithBoxFormWidget(
      boxConstraints: const BoxConstraints(
        maxHeight: BoxSize.boxSize12,
        minHeight: BoxSize.boxSize12,
      ),
      hintText: localization.translate(
        LanguageKey.controlNetUploadScreenEnterPromptHint,
      ),
      controller: promptController,
      label: localization.translate(
        LanguageKey.controlNetUploadScreenEnterPrompt,
      ),
    );
  }
}
