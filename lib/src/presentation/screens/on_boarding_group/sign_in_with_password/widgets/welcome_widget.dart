import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:flutter/material.dart';

class WelcomeWidget extends StatelessWidget {
  final AppLocalizationManager localization;
  final AppTheme appTheme;

  const WelcomeWidget({
    required this.localization,
    required this.appTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization.translate(
            LanguageKey.onBoardingSignInWithPasswordScreenWelcomeBackTitle,
          ),
          style: AppTypography.heading3Bold.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          localization.translate(
            LanguageKey.onBoardingSignInWithPasswordScreenWelcomeBackTitle,
          ),
          style: AppTypography.bodyXLargeRegular.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
      ],
    );
  }
}
