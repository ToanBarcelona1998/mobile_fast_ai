import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'widgets/image_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/up_load_image_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/bottom_widget.dart';
import 'widgets/content_widget.dart';

class RealisticArtGeneratorUploadScreen extends StatefulWidget {
  const RealisticArtGeneratorUploadScreen({super.key});

  @override
  State<RealisticArtGeneratorUploadScreen> createState() =>
      _RealisticArtGeneratorUploadScreenState();
}

class _RealisticArtGeneratorUploadScreenState
    extends State<RealisticArtGeneratorUploadScreen> {
  String? file;

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
                  LanguageKey.realisticArtGeneratorScreenAppBarTitle,
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
                              RealisticArtGeneratorUploadContentWidget(
                                appTheme: appTheme,
                                localization: localization,
                              ),
                              file != null
                                  ? RealisticArtGeneratorUploadImageWidget(
                                      file: file!,
                                      appTheme: appTheme,
                                      onRemoveFile: () {
                                        file = null;
                                        setState(() {});
                                      },
                                    )
                                  : UploadSingleImageWidget(
                                      appTheme: appTheme,
                                      width: double.maxFinite,
                                      onPickImageSuccess: (file) {
                                        this.file = file;

                                        setState(() {});
                                      },
                                      label: localization.translate(
                                        LanguageKey
                                            .realisticArtGeneratorScreenUpload,
                                      ),
                                      height: context.h * 0.45,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    RealisticArtGeneratorBottomWidget(
                      appTheme: appTheme,
                      localization: localization,
                      onTap: () {
                        AppNavigator.push(
                          RoutePath.realisticEditArtWork,
                        );
                      },
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
