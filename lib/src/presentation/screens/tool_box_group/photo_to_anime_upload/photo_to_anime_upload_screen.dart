import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'widgets/bottom_widget.dart';
import 'widgets/upload_image_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/up_load_image_widget.dart';
import 'widgets/upload_content_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class PhotoToAnimeUploadScreen extends StatefulWidget {
  const PhotoToAnimeUploadScreen({super.key});

  @override
  State<PhotoToAnimeUploadScreen> createState() =>
      _PhotoToAnimeUploadScreenState();
}

class _PhotoToAnimeUploadScreenState extends State<PhotoToAnimeUploadScreen> {
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
                  LanguageKey.photoToAnimeUploadScreenAppBarTitle,
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
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              PhotoToAnimeUploadContentWidget(
                                appTheme: appTheme,
                                localization: localization,
                              ),
                              file != null
                                  ? PhotoToAnimeUploadImageWidget(
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
                                            .photoToAnimeUploadScreenUpload,
                                      ),
                                      height: context.h * 0.45,
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    PhotoToAnimeUploadBottomWidget(
                      appTheme: appTheme,
                      localization: localization,
                      onTap: () {
                        AppNavigator.push(
                          RoutePath.photoToAnimeEditArtWork,
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
