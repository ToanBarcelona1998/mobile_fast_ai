import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:flutter/material.dart';

class ThreeDToImageUploadEnterPromptWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final TextEditingController enterPromptController;

  const ThreeDToImageUploadEnterPromptWidget({
    required this.localization,
    required this.appTheme,
    required this.enterPromptController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextInputWithBoxFormWidget(
      controller: enterPromptController,
      label: localization.translate(
        LanguageKey.threeDToImageUploadScreenEnterPrompt,
      ),
      hintText: localization.translate(
        LanguageKey.threeDToImageUploadScreenEnterPromptHint,
      ),
    );
  }
}
