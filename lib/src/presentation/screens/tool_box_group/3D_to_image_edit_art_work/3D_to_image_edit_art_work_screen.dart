import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'widgets/bottom_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/generate_image_widget.dart';

class ThreeDToImageEditArtWorkScreen extends StatefulWidget {
  const ThreeDToImageEditArtWorkScreen({
    super.key,
  });

  @override
  State<ThreeDToImageEditArtWorkScreen> createState() =>
      _ThreeDToImageEditArtWorkScreenState();
}

class _ThreeDToImageEditArtWorkScreenState
    extends State<ThreeDToImageEditArtWorkScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
                  LanguageKey.threeDToImageEditArtWorkScreenAppBarTitle,
                ),
                actions: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      AppNavigator.push(
                        RoutePath.threeDToImageFinalize,
                        randomDummyImg(),
                      );
                    },
                    child: Text(
                      localization.translate(
                        LanguageKey.threeDToImageEditArtWorkScreenFinalize,
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: Spacing.spacing07,
                          horizontal: Spacing.spacing05,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ThreeDToImageEditArtWorkGenerateImageWidget(
                                appTheme: appTheme,
                                localization: localization,
                                url: randomDummyImg(),
                                onDownLoad: () {},
                                loading: false,
                              ),
                              const SizedBox(
                                height: BoxSize.boxSize05,
                              ),
                              Row(
                                children: List.generate(
                                  4,
                                  (index) => Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: Spacing.spacing03,
                                      ),
                                      child:
                                          ThreeDToImageEditArtWorkBoxImageWidget(
                                        url: randomDummyImg(),
                                        localization: localization,
                                        appTheme: appTheme,
                                        onTap: () {},
                                        isSelected: index == 0,
                                        loading: false,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ThreeDToImageEditArtWorkBottomWidget(
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
