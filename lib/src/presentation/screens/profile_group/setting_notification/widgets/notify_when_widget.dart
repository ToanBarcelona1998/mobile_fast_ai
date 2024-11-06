import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/material.dart';

import 'notification_widget.dart';

class SettingNotificationNotifyMeWhenWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;

  const SettingNotificationNotifyMeWhenWidget({
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
            LanguageKey.settingNotificationScreenNotifyMeWhen,
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
            LanguageKey.settingNotificationScreenReasonOne,
          ),
          appTheme: appTheme,
          onChanged: (p0) {},
          value: true,
        ),
        SettingNotificationWidget(
          text: localization.translate(
            LanguageKey.settingNotificationScreenReasonTwo,
          ),
          appTheme: appTheme,
          onChanged: (p0) {},
        ),
        SettingNotificationWidget(
          text: localization.translate(
            LanguageKey.settingNotificationScreenReasonThree,
          ),
          appTheme: appTheme,
          onChanged: (p0) {},
          value: true,
        ),
        SettingNotificationWidget(
          text: localization.translate(
            LanguageKey.settingNotificationScreenReasonFour,
          ),
          appTheme: appTheme,
          onChanged: (p0) {},
        ),
        SettingNotificationWidget(
          text: localization.translate(
            LanguageKey.settingNotificationScreenReasonFive,
          ),
          appTheme: appTheme,
          onChanged: (p0) {},
          value: true,
        ),
        SettingNotificationWidget(
          text: localization.translate(
            LanguageKey.settingNotificationScreenReasonSix,
          ),
          appTheme: appTheme,
          onChanged: (p0) {},
        ),
        SettingNotificationWidget(
          text: localization.translate(
            LanguageKey.settingNotificationScreenReasonSeven,
          ),
          appTheme: appTheme,
          onChanged: (p0) {},
        ),
      ],
    );
  }
}
