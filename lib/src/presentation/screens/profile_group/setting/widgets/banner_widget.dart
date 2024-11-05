import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SettingBannerWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final bool enable;

  const SettingBannerWidget({
    required this.appTheme,
    required this.localization,
    this.enable = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (!enable) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(
        Spacing.spacing05,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          BorderRadiusSize.borderRadius04,
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            appTheme.primaryColor700,
            appTheme.primaryColor900,
          ],
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AssetImagePath.imgSettingUpgradeToPro,
          ),
          const SizedBox(
            width: BoxSize.boxSize04,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  localization.translate(
                    LanguageKey.settingScreenUpgradeToPro,
                  ),
                  style: AppTypography.heading4Bold.copyWith(
                    color: appTheme.otherColorWhite,
                  ),
                ),
                const SizedBox(
                  height: BoxSize.boxSize02,
                ),
                Text(
                  localization.translate(
                    LanguageKey.settingScreenUpgradeToProDescription,
                  ),
                  style: AppTypography.bodyMediumMedium.copyWith(
                    color: appTheme.otherColorWhite,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: BoxSize.boxSize04,
          ),
          SvgPicture.asset(
            AssetIconPath.icCommonArrowNext,
            color: appTheme.otherColorWhite,
          ),
        ],
      ),
    );
  }
}
