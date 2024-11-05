import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'widgets/bottom_widget.dart';
import 'widgets/colorize_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class RecolorEditArtWorkScreen extends StatefulWidget {
  const RecolorEditArtWorkScreen({super.key});

  @override
  State<RecolorEditArtWorkScreen> createState() =>
      _RecolorEditArtWorkScreenState();
}

class _RecolorEditArtWorkScreenState extends State<RecolorEditArtWorkScreen> {
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
                  LanguageKey.recolorImageEditArtWorkScreenAppBarTitle,
                ),
                actions: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      AppNavigator.push(
                        RoutePath.recolorImageFinalize,
                        randomDummyImg(),
                      );
                    },
                    child: Text(
                      localization.translate(
                        LanguageKey.recolorImageEditArtWorkScreenFinalize,
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
                            horizontal: Spacing.spacing05,
                            vertical: Spacing.spacing07,
                          ),
                          child: Column(
                            children: [
                              NetworkImageWidget(
                                imageUrl: randomDummyImg(),
                                appTheme: appTheme,
                                width: double.maxFinite,
                                height: context.h * 0.45,
                              ),
                              const SizedBox(
                                height: BoxSize.boxSize05,
                              ),
                              RecolorColorizeWidget(
                                appTheme: appTheme,
                                localization: localization,
                                selectedIndex: 0,
                                onSelected: (p0) {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    RecolorEditArtWorkBottomWidget(
                      appTheme: appTheme,
                      localization: localization,
                      onReGenerateTap: () {},
                      onDownloadTap: () {},
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
