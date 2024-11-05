import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'widgets/avatar_generator_uploaded_form_widget.dart';
import 'widgets/avatar_generator_uploading_form_widget.dart';
import 'widgets/avatar_generator_upload_form_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

enum AIAvatarGeneratorStatus {
  none,
  uploading,
  uploaded,
}

class AvatarGeneratorUploadScreen extends StatefulWidget {
  const AvatarGeneratorUploadScreen({super.key});

  @override
  State<AvatarGeneratorUploadScreen> createState() =>
      _AvatarGeneratorUploadScreenState();
}

class _AvatarGeneratorUploadScreenState
    extends State<AvatarGeneratorUploadScreen> {
  final List<String> choseFiles = List.empty(growable: true);

  AIAvatarGeneratorStatus status = AIAvatarGeneratorStatus.none;

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
                  LanguageKey.aiAvatarUploadScreenAppBarTitle,
                ),
              ),
              body: SafeArea(
                child: Builder(
                  builder: (context) {
                    switch (status) {
                      case AIAvatarGeneratorStatus.none:
                        return AvatarGeneratorUploadFormWidget(
                          appTheme: appTheme,
                          localization: localization,
                          choseFiles: choseFiles,
                          onChanged: (files) {
                            choseFiles.clear();

                            choseFiles.addAll(files);
                            setState(() {});
                          },
                          onGenerated: () {
                            setState(() {
                              status = AIAvatarGeneratorStatus.uploading;
                            });
                          },
                        );
                      case AIAvatarGeneratorStatus.uploading:
                        return AvatarGeneratorUploadingFormWidget(
                          images: choseFiles,
                          localization: localization,
                          appTheme: appTheme,
                          onNotify: () {
                            setState(() {
                              status = AIAvatarGeneratorStatus.uploaded;
                            });
                          },
                        );
                      case AIAvatarGeneratorStatus.uploaded:
                        return AvatarGeneratorUploadedFormWidget(
                          appTheme: appTheme,
                          localization: localization,
                          images: const [
                            ...dummyGoodImages,
                            ...dummyGoodImages,
                          ],
                          onGenerateMore: () {},
                          onDownloadAll: () {},
                          onDownLoad: (url) {
                            AppNavigator.push(
                              RoutePath.avatarGeneratorDownload,
                              url,
                            );
                          },
                        );
                    }
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
