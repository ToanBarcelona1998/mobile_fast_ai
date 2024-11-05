import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'widgets/aspect_ratio_widget.dart';
import 'widgets/background_color_widget.dart';
import 'widgets/bottom_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/generate_image_widget.dart';

class LogoGeneratorEditArtWorkScreen extends StatefulWidget {
  const LogoGeneratorEditArtWorkScreen({super.key});

  @override
  State<LogoGeneratorEditArtWorkScreen> createState() =>
      _LogoGeneratorEditArtWorkScreenState();
}

class _LogoGeneratorEditArtWorkScreenState
    extends State<LogoGeneratorEditArtWorkScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // fake loading
      await Future.delayed(const Duration(
        seconds: 3,
      ));

      if (context.mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
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
                  LanguageKey.logoGeneratorEditArtWorkScreenGenerate,
                ),
                actions: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      AppNavigator.push(
                        RoutePath.logoGeneratorFinalize,
                        randomDummyImg(),
                      );
                    },
                    child: Text(
                      localization.translate(
                        LanguageKey.logoGeneratorEditArtWorkScreenFinalize,
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
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: Spacing.spacing07,
                            horizontal: Spacing.spacing05,
                          ),
                          child: Column(
                            children: [
                              LogoGeneratorEditArtWorkGenerateImageWidget(
                                url: randomDummyImg(),
                                localization: localization,
                                appTheme: appTheme,
                                loading: isLoading,
                                onDownLoad: () {},
                              ),
                              const SizedBox(
                                height: BoxSize.boxSize05,
                              ),
                              Row(
                                children: List.generate(
                                  4,
                                  (index) {
                                    final String url = dummyImages[index];
                                    return Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: Spacing.spacing03,
                                        ),
                                        child:
                                            LogoGeneratorEditArtWorkBoxImageWidget(
                                          appTheme: appTheme,
                                          localization: localization,
                                          url: url,
                                          loading: isLoading,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: BoxSize.boxSize05,
                              ),
                              LogoGeneratorEditArtWorkRatioWidget(
                                appTheme: appTheme,
                                localization: localization,
                                onTap: () {},
                              ),
                              const SizedBox(
                                height: BoxSize.boxSize05,
                              ),
                              ControlNetEditArtWorkBackgroundColorWidget(
                                localization: localization,
                                appTheme: appTheme,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    LogoGeneratorEditArtWorkBottomWidget(
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
