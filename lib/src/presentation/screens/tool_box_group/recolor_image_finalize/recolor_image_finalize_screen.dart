import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'widgets/bottom_widget.dart';
import 'widgets/content_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class RecolorImageFinalizeScreen extends StatefulWidget {
  final String url;

  // add more arguments here

  const RecolorImageFinalizeScreen({
    required this.url,
    super.key,
  });

  @override
  State<RecolorImageFinalizeScreen> createState() => _RecolorImageFinalizeScreenState();
}

class _RecolorImageFinalizeScreenState extends State<RecolorImageFinalizeScreen> {
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
                  LanguageKey.recolorImageFinalizeScreenAppBarTitle,
                ),
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
                                imageUrl: widget.url,
                                appTheme: appTheme,
                                width: double.maxFinite,
                                height: context.h * 0.45,
                              ),
                              const SizedBox(
                                height: BoxSize.boxSize05,
                              ),
                              RecolorImageFinalizeContentWidget(
                                title: 'AI Colorize : Portrait of African Woman',
                                appTheme: appTheme,
                                localization: localization,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    RecolorImageFinalizeBottomWidget(
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
