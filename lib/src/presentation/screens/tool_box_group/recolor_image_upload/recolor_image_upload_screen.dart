import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/up_load_image_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/bottom_widget.dart';
import 'widgets/content_widget.dart';
import 'widgets/image_widget.dart';

class RecolorImageUploadScreen extends StatefulWidget {
  const RecolorImageUploadScreen({super.key});

  @override
  State<RecolorImageUploadScreen> createState() =>
      _RecolorImageUploadScreenState();
}

class _RecolorImageUploadScreenState extends State<RecolorImageUploadScreen> {
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
                  LanguageKey.recolorImageUploadScreenAppBarTitle,
                ),
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Spacing.spacing05,
                          vertical: Spacing.spacing07,
                        ),
                        child: Column(
                          children: [
                            RecolorImageUploadContentWidget(
                              appTheme: appTheme,
                              localization: localization,
                            ),
                            file != null
                                ? RecolorImageUploadImageWidget(
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
                                    height: context.h * 0.45,
                                    label: localization.translate(
                                      LanguageKey
                                          .recolorImageUploadScreenUpload,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    RecolorImageUploadBottomWidget(
                      appTheme: appTheme,
                      localization: localization,
                      onTap: () {
                        AppNavigator.push(
                          RoutePath.recolorImageEditArtWork,
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
