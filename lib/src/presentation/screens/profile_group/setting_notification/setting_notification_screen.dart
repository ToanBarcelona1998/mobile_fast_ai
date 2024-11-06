import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'widgets/notify_when_widget.dart';
import 'widgets/system_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class SettingNotificationScreen extends StatefulWidget {
  const SettingNotificationScreen({super.key});

  @override
  State<SettingNotificationScreen> createState() =>
      _SettingNotificationScreenState();
}

class _SettingNotificationScreenState extends State<SettingNotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (appTheme) {
        return AppLocalizationProvider(
          builder: (localization) {
            return Scaffold(
              backgroundColor: appTheme.bodyBackGroundColor,
              appBar: NormalAppBar(
                appTheme: appTheme,
                title: localization.translate(
                  LanguageKey.settingNotificationScreenAppBarTitle,
                ),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Spacing.spacing05,
                      vertical: Spacing.spacing07,
                    ),
                    child: Column(
                      children: [
                        SettingNotificationNotifyMeWhenWidget(
                          appTheme: appTheme,
                          localization: localization,
                        ),
                        HoLiZonTalDividerWidget(
                          appTheme: appTheme,
                        ),
                        const SizedBox(
                          height: BoxSize.boxSize05,
                        ),
                        SettingNotificationSystemWidget(
                          appTheme: appTheme,
                          localization: localization,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
