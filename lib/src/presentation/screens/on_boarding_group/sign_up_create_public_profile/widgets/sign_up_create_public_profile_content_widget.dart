import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/material.dart';

class SignupCreatePublicProfileContentWidget extends StatelessWidget {
  final AppLocalizationManager localization;
  final AppTheme appTheme;

  const SignupCreatePublicProfileContentWidget({
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
            LanguageKey.onBoardingSignupPublicProfileScreenTitle,
          ),
          style: AppTypography.heading3Bold.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize04,
        ),
        Text(
          localization.translate(
            LanguageKey.onBoardingSignupPublicProfileScreenContent,
          ),
          style: AppTypography.bodyXLargeRegular.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize07,
        ),
      ],
    );
  }
}
