import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/text_effect_edit_art_work/widgets/generate_text_effect_widget.dart';
import 'widgets/aspect_ratio_widget.dart';
import 'widgets/background_color_widget.dart';
import 'widgets/font_widget.dart';
import 'widgets/bottom_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/text_color_widget.dart';

class TextEffectEditArtWorkScreen extends StatefulWidget {
  final String text;
  final String describe;

  const TextEffectEditArtWorkScreen({
    required this.text,
    required this.describe,
    super.key,
  });

  @override
  State<TextEffectEditArtWorkScreen> createState() =>
      _TextEffectEditArtWorkScreenState();
}

class _TextEffectEditArtWorkScreenState
    extends State<TextEffectEditArtWorkScreen> {
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
                  LanguageKey.textEffectEditArtWorkScreenAppBarTitle,
                ),
                actions: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      AppNavigator.push(
                        RoutePath.textEffectFinalize,
                        dummyTextEffect[0],
                      );
                    },
                    child: Text(
                      localization.translate(
                        LanguageKey.textEffectEditArtWorkScreenFinalize,
                      ),
                      style: AppTypography.heading5Bold.copyWith(
                        color: appTheme.statusColorDisButton,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: BoxSize.boxSize05,
                  ),
                ],
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Spacing.spacing05,
                          vertical: Spacing.spacing07,
                        ),
                        children: [
                          TextEffectEditArtWorkGenerateWidget(
                            appTheme: appTheme,
                            isLoading: false,
                          ),
                          TextEffectEditArtWorkRatioWidget(
                            appTheme: appTheme,
                            localization: localization,
                            onTap: () {},
                          ),
                          const SizedBox(
                            height: BoxSize.boxSize05,
                          ),
                          TextEffectEditArtWorkFontWidget(
                            appTheme: appTheme,
                            localization: localization,
                            onSelected: (index) {},
                          ),
                          const SizedBox(
                            height: BoxSize.boxSize05,
                          ),
                          TextEffectEditArtWorkBackgroundColorWidget(
                            appTheme: appTheme,
                            localization: localization,
                            onSelected: (index) {},
                          ),
                          const SizedBox(
                            height: BoxSize.boxSize05,
                          ),
                          TextEffectEditArtWorkTextColorWidget(
                            appTheme: appTheme,
                            localization: localization,
                            onSelected: (index) {},
                          ),
                        ],
                      ),
                    ),
                    TextEffectArtEditArtWorkBottomWidget(
                      appTheme: appTheme,
                      localization: localization,
                      onReGenerateTap: () {},
                      onDownloadAllTap: () {},
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
