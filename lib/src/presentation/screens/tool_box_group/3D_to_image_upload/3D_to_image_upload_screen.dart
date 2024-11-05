import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/3D_to_image_upload/widgets/enter_prompt_widget.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/extend_image_upload/widgets/content_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/up_load_image_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/bottom_widget.dart';
import 'widgets/upload_image_widget.dart';

class ThreeDToImageUploadScreen extends StatefulWidget {
  const ThreeDToImageUploadScreen({super.key});

  @override
  State<ThreeDToImageUploadScreen> createState() =>
      _ThreeDToImageUploadScreenState();
}

class _ThreeDToImageUploadScreenState extends State<ThreeDToImageUploadScreen> {
  String? file;

  final TextEditingController _enterPromptController = TextEditingController();

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
                  LanguageKey.threeDToImageUploadScreenAppBarTitle,
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
                              ExtendImageUploadContentWidget(
                                appTheme: appTheme,
                                localization: localization,
                              ),
                              file != null
                                  ? ThreeDToImageUploadImageWidget(
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
                              const SizedBox(
                                height: BoxSize.boxSize05,
                              ),
                              ThreeDToImageUploadEnterPromptWidget(
                                localization: localization,
                                appTheme: appTheme,
                                enterPromptController: _enterPromptController,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ThreeDToImageUploadBottomWidget(
                      appTheme: appTheme,
                      localization: localization,
                      onTap: () {
                        AppNavigator.push(
                          RoutePath.threeDToImageEditArtWork,
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
