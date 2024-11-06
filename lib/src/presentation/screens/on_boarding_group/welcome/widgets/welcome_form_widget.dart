import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeFormWidget extends StatelessWidget {
  final AppLocalizationManager localization;
  final AppTheme appTheme;

  const WelcomeFormWidget({
    required this.appTheme,
    required this.localization,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        SvgPicture.asset(
          AssetLogoPath.logo,
          width: 120,
        ),
        const SizedBox(
          height: 36,
        ),
        Text(
          localization.translate(
            LanguageKey.globalAppName,
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
            LanguageKey.onBoardingWelcomeScreenContent,
          ),
          style: AppTypography.bodyXLargeRegular.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
      ],
    );
  }
}
