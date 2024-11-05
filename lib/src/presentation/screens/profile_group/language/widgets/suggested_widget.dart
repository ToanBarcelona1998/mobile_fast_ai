import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'language_widget.dart';
import 'package:flutter/material.dart';

class LanguageSuggestedWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;

  const LanguageSuggestedWidget({
    required this.appTheme,
    required this.localization,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization.translate(
            LanguageKey.languageScreenSuggested,
          ),
          style: AppTypography.heading6Bold.copyWith(
            color: appTheme.greyScaleColor600,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        LanguageWidget(
          appTheme: appTheme,
          text: 'English (US)',
          isSelected: true,
        ),
        LanguageWidget(
          appTheme: appTheme,
          text: 'English (UK)',
        ),
      ],
    );
  }
}
