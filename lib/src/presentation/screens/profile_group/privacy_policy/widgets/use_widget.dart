import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyUseWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;

  const PrivacyPolicyUseWidget({
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
            LanguageKey.privacyPolicyScreenUse,
          ),
          style: AppTypography.heading4Bold.copyWith(
            color: appTheme.greyScaleColor800,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize02,
        ),
        Text(
          localization.translate(
            LanguageKey.privacyPolicyScreenUseContent,
          ),
          style: AppTypography.bodyLargeRegular.copyWith(
            color: appTheme.greyScaleColor800,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize02,
        ),
        Text(
          localization.translate(
            LanguageKey.privacyPolicyScreenUseDescriptionOne,
          ),
          style: AppTypography.bodyLargeRegular.copyWith(
            color: appTheme.greyScaleColor800,
          ),
        ),
      ],
    );
  }
}
