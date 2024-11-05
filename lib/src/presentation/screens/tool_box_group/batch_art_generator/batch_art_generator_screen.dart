import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'widgets/art_style_widget.dart';
import 'widgets/aspect_ratio_widget.dart';
import 'widgets/batch_production_widget.dart';
import 'widgets/enter_prompt_widget.dart';
import 'widgets/input_images_widget.dart';
import 'widgets/bottom_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class BatchArtGeneratorScreen extends StatefulWidget {
  const BatchArtGeneratorScreen({super.key});

  @override
  State<BatchArtGeneratorScreen> createState() =>
      _BatchArtGeneratorScreenState();
}

class _BatchArtGeneratorScreenState extends State<BatchArtGeneratorScreen> {
  final TextEditingController _enterPromptController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _enterPromptController.dispose();
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
                  LanguageKey.batchArtGeneratorScreenAppBarTitle,
                ),
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
                              BatchArtGeneratorEnterPromptWidget(
                                enterPromptController: _enterPromptController,
                                localization: localization,
                              ),
                              const SizedBox(
                                height: BoxSize.boxSize05,
                              ),
                              BatchArtGeneratorProductionWidget(
                                appTheme: appTheme,
                                localization: localization,
                                onMinusTap: () {},
                                onPlusTap: () {},
                              ),
                              const SizedBox(
                                height: BoxSize.boxSize05,
                              ),
                              BatchArtGeneratorRatioWidget(
                                appTheme: appTheme,
                                localization: localization,
                                onTap: () {},
                              ),
                              const SizedBox(
                                height: BoxSize.boxSize05,
                              ),
                              BatchArtGeneratorStyleWidget(
                                localization: localization,
                                appTheme: appTheme,
                              ),
                              const SizedBox(
                                height: BoxSize.boxSize05,
                              ),
                              BatchArtGeneratorInputImagesWidget(
                                localization: localization,
                                appTheme: appTheme,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    BatchArtGeneratorBottomWidget(
                      localization: localization,
                      onTap: () {
                        AppNavigator.push(RoutePath.batchArtGeneratorList);
                      },
                      appTheme: appTheme,
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
