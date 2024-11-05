import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutVersionWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final String version;

  const AboutVersionWidget({
    required this.appTheme,
    required this.localization,
    required this.version,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AssetLogoPath.logo,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        Text(
          '${localization.translate(
            LanguageKey.globalAppName,
          )} $version',
          style: AppTypography.heading4Bold.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
      ],
    );
  }
}
