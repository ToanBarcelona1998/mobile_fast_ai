import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'widgets/about_widget.dart';
import 'widgets/general_widget.dart';
import 'widgets/logout_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bottom_sheet_provider.dart';
import 'widgets/banner_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (appTheme) {
        return AppLocalizationProvider(
          builder: (localization) {
            return Scaffold(
              appBar: NormalAppBar(
                appTheme: appTheme,
                title: localization.translate(
                  LanguageKey.settingScreenAppBarTitle,
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
                        SettingBannerWidget(
                          appTheme: appTheme,
                          localization: localization,
                        ),
                        const SizedBox(
                          height: BoxSize.boxSize05,
                        ),
                        SettingGeneralWidget(
                          appTheme: appTheme,
                          localization: localization,
                        ),
                        const SizedBox(
                          height: BoxSize.boxSize05,
                        ),
                        SettingAboutWidget(
                          appTheme: appTheme,
                          localization: localization,
                          onLogout: () {
                            _onLogout(
                              appTheme,
                              localization,
                            );
                          },
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

  void _onLogout(AppTheme appTheme, AppLocalizationManager localization) {
    AppBottomSheetProvider.showNormalBottomSheet(
      context,
      theme: appTheme,
      child: SettingLogoutWidget(
        appTheme: appTheme,
        localization: localization,
        onAgree: () {},
      ),
    );
  }
}
