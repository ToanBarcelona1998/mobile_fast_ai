import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_box_widget.dart';
import 'package:flutter/material.dart';

class RemoveBackgroundFinalizeContentWidget extends StatelessWidget {
  final AppLocalizationManager localization;
  final AppTheme appTheme;
  final String title;

  const RemoveBackgroundFinalizeContentWidget({
    required this.title,
    required this.appTheme,
    required this.localization,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextBoxWithLabel(
      text: title,
      appTheme: appTheme,
      labelWidget: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: localization.translate(
                LanguageKey.removeBackgroundFinalizeScreenAddTitle,
              ),
              style: AppTypography.heading5Bold.copyWith(
                color: appTheme.greyScaleColor900,
              ),
            ),
            TextSpan(
              text: ' (${localization.translate(
                LanguageKey.removeBackgroundFinalizeScreenOptional,
              )})',
              style: AppTypography.bodyLargeRegular.copyWith(
                color: appTheme.greyScaleColor700,
              )
            )
          ],
        ),
      ),
    );
  }
}
