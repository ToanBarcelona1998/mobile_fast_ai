import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'widgets/art_style_widget.dart';
import 'widgets/enter_prompt_widget.dart';
import 'widgets/espect_ratio_widget.dart';
import 'widgets/input_images_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                leadingWidget: Row(
                  children: [
                    const SizedBox(
                      width: BoxSize.boxSize05,
                    ),
                    SvgPicture.asset(
                      AssetLogoPath.logoSmall,
                    )
                  ],
                ),
                actions: [
                  SvgPicture.asset(
                    AssetIconPath.icCommonNotification,
                  ),
                  const SizedBox(
                    width: BoxSize.boxSize05,
                  ),
                ],
                title: localization.translate(
                  LanguageKey.globalAppName,
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
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            EnterPromptWidget(
                              appTheme: appTheme,
                              localization: localization,
                              promptController: _promptController,
                              onTap: () {
                                AppNavigator.push(
                                  RoutePath.explorePrompt,
                                );
                              },
                            ),
                            const SizedBox(
                              height: BoxSize.boxSize07,
                            ),
                            AspectRatioWidget(
                              appTheme: appTheme,
                              localization: localization,
                              onTap: () {
                                AppNavigator.push(
                                  RoutePath.editArtWork,
                                );
                              },
                            ),
                            const SizedBox(
                              height: BoxSize.boxSize07,
                            ),
                            ArtStyleWidget(
                              localization: localization,
                              appTheme: appTheme,
                            ),
                            const SizedBox(
                              height: BoxSize.boxSize07,
                            ),
                            InputImagesWidget(
                              localization: localization,
                              appTheme: appTheme,
                            ),
                            const SizedBox(
                              height: BoxSize.boxSize07,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: BoxSize.boxSize05,
                      ),
                      PrimaryAppButton(
                        text: localization.translate(
                          LanguageKey.homePageGenerate,
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
