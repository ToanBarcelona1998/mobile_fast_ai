import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'widgets/aspect_ratio_widget.dart';
import 'widgets/bottom_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/generate_image_widget.dart';

class TextToPatternEditArtWorkScreen extends StatefulWidget {
  const TextToPatternEditArtWorkScreen({super.key});

  @override
  State<TextToPatternEditArtWorkScreen> createState() =>
      _TextToPatternEditArtWorkScreenState();
}

class _TextToPatternEditArtWorkScreenState
    extends State<TextToPatternEditArtWorkScreen> {
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
                  LanguageKey.textToPatternEditArtWorkScreenAppBarTitle,
                ),
                actions: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      AppNavigator.push(
                        RoutePath.textToPatternFinalize,
                        dummyTextEffect[0],
                      );
                    },
                    child: Text(
                      localization.translate(
                        LanguageKey.textToPatternEditArtWorkScreenFinalize,
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
                              TextToPatternEditArtWorkGenerateImageWidget(
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
                                            TextToPatternEditArtWorkBoxImageWidget(
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
                              TextToPatternEditArtWorkRatioWidget(
                                appTheme: appTheme,
                                localization: localization,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextToPatternEditArtWorkBottomWidget(
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
