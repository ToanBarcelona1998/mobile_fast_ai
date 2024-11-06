import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/screens/profile_group/language/widgets/languages_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'widgets/suggested_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
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
                  LanguageKey.languageScreenAppBarTitle,
                ),
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.spacing05,
                    vertical: Spacing.spacing07,
                  ),
                  child: Column(
                    children: [
                      LanguageSuggestedWidget(
                        appTheme: appTheme,
                        localization: localization,
                      ),
                      HoLiZonTalDividerWidget(
                        appTheme: appTheme,
                      ),
                      const SizedBox(
                        height: BoxSize.boxSize05,
                      ),
                      Expanded(
                        child: LanguagesWidget(
                          appTheme: appTheme,
                          localization: localization,
                          languages: const [
                            'Mandarin',
                            'Spanish',
                            'Arabic',
                            'Bengali',
                            'Russian',
                            'Japanese',
                            'Korean',
                            'Indonesia',
                          ],
                        ),
                      ),
                    ],
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
