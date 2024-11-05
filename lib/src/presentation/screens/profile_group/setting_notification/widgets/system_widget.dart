import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'notification_widget.dart';
import 'package:flutter/material.dart';

class SettingNotificationSystemWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;

  const SettingNotificationSystemWidget({
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
            LanguageKey.settingNotificationScreenSystem,
          ),
          style: AppTypography.heading5Bold.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        SettingNotificationWidget(
          text: localization.translate(
            LanguageKey.settingNotificationScreenAppSystem,
          ),
          appTheme: appTheme,
          value: true,
          onChanged: (p0) {},
        ),
        SettingNotificationWidget(
          text: localization.translate(
            LanguageKey.settingNotificationScreenGuid,
          ),
          appTheme: appTheme,
          onChanged: (p0) {},
        ),
        SettingNotificationWidget(
          text: localization.translate(
            LanguageKey.settingNotificationScreenParticipate,
          ),
          appTheme: appTheme,
          onChanged: (p0) {},
          value: true,
        ),
      ],
    );
  }
}
