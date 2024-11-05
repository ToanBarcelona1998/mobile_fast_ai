import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'widgets/bottom_widget.dart';
import 'widgets/enter_prompt_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/up_load_image_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/content_widget.dart';
import 'widgets/image_widget.dart';

class ControlNetUploadScreen extends StatefulWidget {
  const ControlNetUploadScreen({super.key});

  @override
  State<ControlNetUploadScreen> createState() => _ControlNetUploadScreenState();
}

class _ControlNetUploadScreenState extends State<ControlNetUploadScreen> {
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
                  LanguageKey.controlNetUploadScreenAppBarTitle,
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
                              ControlNetUploadContentWidget(
                                appTheme: appTheme,
                                localization: localization,
                              ),
                              file != null
                                  ? ControlNetUploadImageWidget(
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
                                      height: context.h * 0.45,
                                      onPickImageSuccess: (file) {
                                        this.file = file;

                                        setState(() {});
                                      },
                                      label: localization.translate(
                                        LanguageKey
                                            .controlNetUploadScreenUpload,
                                      ),
                                    ),
                              const SizedBox(
                                height: BoxSize.boxSize05,
                              ),
                              ControlNetUploadEnterPromptWidget(
                                promptController: _enterPromptController,
                                localization: localization,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ControlNetUploadBottomWidget(
                      localization: localization,
                      onTap: () {
                        AppNavigator.push(RoutePath.controlNetEditArtWork);
                      },
                      appTheme: appTheme,
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
