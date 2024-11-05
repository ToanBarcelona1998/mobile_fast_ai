import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'widgets/content_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'widgets/bottom_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class AnimeFinalizeScreen extends StatefulWidget {
  final String url;

  // add more arguments here

  const AnimeFinalizeScreen({
    required this.url,
    super.key,
  });

  @override
  State<AnimeFinalizeScreen> createState() => _AnimeFinalizeScreenState();
}

class _AnimeFinalizeScreenState extends State<AnimeFinalizeScreen> {
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
                  LanguageKey.animeFinalizeScreenAppBarTitle,
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
                          NetworkImageWidget(
                            imageUrl: widget.url,
                            appTheme: appTheme,
                            width: double.maxFinite,
                            height: context.h * 0.45,
                          ),
                          const SizedBox(
                            height: BoxSize.boxSize05,
                          ),
                          AnimeFinalizeContentWidget(
                            title: 'Chibi Alien Cyberpunk Robo',
                            showPromptTitle: 'Super detailed, create a nft of happy baby alien robot warrior with glasses, with big eyes, laser gun, strong, technology, shoes, pixar style, neon, punk, metal',
                            showNegativePromptTitle: 'Bad anatomy, watermark, text, error, blurry, cropped, worst quality, low quality, signature',
                            showCFGTitle: '9',
                            showSeedTitle: '94756375805',
                            appTheme: appTheme,
                            localization: localization,
                          ),
                        ],
                      ),
                    ),
                    AnimeFinalizeBottomWidget(
                      appTheme: appTheme,
                      localization: localization,
                      onDownloadArt: () {},
                      onShareToFeed: () {},
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
