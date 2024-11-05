import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/switch_widget.dart';
import 'setting_widget.dart';
import 'package:flutter/material.dart';

class SettingGeneralWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;

  const SettingGeneralWidget({
    required this.appTheme,
    required this.localization,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingTitleWidget(
          text: localization.translate(
            LanguageKey.settingScreenGeneral,
          ),
          appTheme: appTheme,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        SettingWidget(
          text: localization.translate(
            LanguageKey.settingScreenPersonalInfo,
          ),
          localization: localization,
          onTap: () {
            AppNavigator.push(
              RoutePath.personalInfo,
            );
          },
          appTheme: appTheme,
          svgIconPath: AssetIconPath.icSettingPersonal,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        SettingWidget(
          text: localization.translate(
            LanguageKey.settingScreenPaymentMethod,
          ),
          localization: localization,
          onTap: () {},
          appTheme: appTheme,
          svgIconPath: AssetIconPath.icSettingPaymentMethod,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        SettingWidget(
          text: localization.translate(
            LanguageKey.settingScreenNotification,
          ),
          localization: localization,
          onTap: () {
            AppNavigator.push(
              RoutePath.settingNotification,
            );
          },
          appTheme: appTheme,
          svgIconPath: AssetIconPath.icSettingNotification,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        SettingWidget(
          text: localization.translate(
            LanguageKey.settingScreenSecurity,
          ),
          localization: localization,
          onTap: () {
            AppNavigator.push(
              RoutePath.security,
            );
          },
          appTheme: appTheme,
          svgIconPath: AssetIconPath.icSettingSecurity,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        SettingWidget(
          text: localization.translate(
            LanguageKey.settingScreenLanguage,
          ),
          localization: localization,
          onTap: () {
            AppNavigator.push(
              RoutePath.language,
            );
          },
          appTheme: appTheme,
          svgIconPath: AssetIconPath.icSettingLanguage,
          suffix: TextWithIconWidget(
            title: 'English (US)',
            icSvgPath: AssetIconPath.icCommonArrowNext,
            appTheme: appTheme,
            style: AppTypography.bodyXLargeSemiBold
                .copyWith(color: appTheme.greyScaleColor900),
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        SettingWidget(
          text: localization.translate(
            LanguageKey.settingScreenDarkMode,
          ),
          localization: localization,
          onTap: () {},
          appTheme: appTheme,
          svgIconPath: AssetIconPath.icSettingDarkMode,
          suffix: SwitchWidget(
            onChanged: (p0) {},
            isSelected: false,
            appTheme: appTheme,
          ),
        ),
      ],
    );
  }
}
