import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'setting_widget.dart';
import 'package:flutter/material.dart';

class SettingAboutWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final VoidCallback onLogout;

  const SettingAboutWidget({
    required this.appTheme,
    required this.localization,
    required this.onLogout,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingTitleWidget(
          text: localization.translate(
            LanguageKey.settingScreenAbout,
          ),
          appTheme: appTheme,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        SettingWidget(
          text: localization.translate(
            LanguageKey.settingScreenFollowUs,
          ),
          localization: localization,
          onTap: () {
            AppNavigator.push(
              RoutePath.followUs,
            );
          },
          appTheme: appTheme,
          svgIconPath: AssetIconPath.icSettingFollowUs,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        SettingWidget(
          text: localization.translate(
            LanguageKey.settingScreenPrivacyPolicy,
          ),
          localization: localization,
          onTap: () {
            AppNavigator.push(
              RoutePath.privacyPolicy,
            );
          },
          appTheme: appTheme,
          svgIconPath: AssetIconPath.icSettingPrivacyPolicy,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        SettingWidget(
          text: localization.translate(
            LanguageKey.settingScreenAboutApp,
          ),
          localization: localization,
          onTap: () {
            AppNavigator.push(
              RoutePath.about,
            );
          },
          appTheme: appTheme,
          svgIconPath: AssetIconPath.icSettingAbout,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        GestureDetector(
          onTap: onLogout,
          behavior: HitTestBehavior.opaque,
          child: IconWithTextWidget(
            title: localization.translate(
              LanguageKey.settingScreenLogout,
            ),
            icSvgPath: AssetIconPath.icSettingLogout,
            appTheme: appTheme,
            style: AppTypography.heading6Bold.copyWith(
              color: appTheme.statusColorError,
            ),
          ),
        ),
      ],
    );
  }
}
