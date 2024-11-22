import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:flutter/material.dart';

class ImageToPromptResultPromptWidget extends StatelessWidget {
  final AppLocalizationManager localization;
  final AppTheme appTheme;
  final String prompt;

  const ImageToPromptResultPromptWidget({
    required this.localization,
    required this.appTheme,
    required this.prompt,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        Spacing.spacing06,
      ),
      decoration: BoxDecoration(
        color: appTheme.greyScaleColor50,
        borderRadius: BorderRadius.circular(
          BorderRadiusSize.borderRadius03,
        ),
      ),
      child: Text(
        prompt,
        style: AppTypography.bodyLargeMedium.copyWith(
          color: appTheme.greyScaleColor900,
        ),
      ),
    );
  }
}
