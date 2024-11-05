import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyInformationWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;

  const PrivacyPolicyInformationWidget({
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
            LanguageKey.privacyPolicyScreenInformation,
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
            LanguageKey.privacyPolicyScreenInformationContent,
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
            LanguageKey.privacyPolicyScreenInformationDescriptionOne,
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
            LanguageKey.privacyPolicyScreenInformationDescriptionTwo,
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
            LanguageKey.privacyPolicyScreenInformationDescriptionThree,
          ),
          style: AppTypography.bodyLargeRegular.copyWith(
            color: appTheme.greyScaleColor800,
          ),
        ),
      ],
    );
  }
}
