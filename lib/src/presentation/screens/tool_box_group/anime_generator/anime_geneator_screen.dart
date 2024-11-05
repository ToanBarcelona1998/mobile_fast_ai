import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'widgets/bottom_widget.dart';
import 'widgets/anime_style_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/enter_prompt_widget.dart';
import 'widgets/espect_ratio_widget.dart';
import 'widgets/input_images_widget.dart';

class AnimeGeneratorScreen extends StatefulWidget {
  const AnimeGeneratorScreen({super.key});

  @override
  State<AnimeGeneratorScreen> createState() => _AnimeGeneratorScreenState();
}

class _AnimeGeneratorScreenState extends State<AnimeGeneratorScreen> {
  final TextEditingController _promptController = TextEditingController();

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

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
                  LanguageKey.animeGeneratorScreenAppBarTitle,
                ),
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
                          AnimeGeneratorEnterPromptWidget(
                            appTheme: appTheme,
                            localization: localization,
                            promptController: _promptController,
                            onTap: () {},
                          ),
                          const SizedBox(
                            height: BoxSize.boxSize05,
                          ),
                          AnimeGeneratorAspectRatioWidget(
                            appTheme: appTheme,
                            localization: localization,
                            onTap: () {
                              AppNavigator.push(
                                RoutePath.animeEditArtWork,
                              );
                            },
                          ),
                          const SizedBox(
                            height: BoxSize.boxSize05,
                          ),
                          AnimeGeneratorStyleWidget(
                            localization: localization,
                            appTheme: appTheme,
                          ),
                          const SizedBox(
                            height: BoxSize.boxSize05,
                          ),
                          AnimeGeneratorInputImagesWidget(
                            localization: localization,
                            appTheme: appTheme,
                          ),
                        ],
                      ),
                    ),
                    AnimeGeneratorBottomWidget(
                      appTheme: appTheme,
                      localization: localization,
                      onTap: () {},
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
