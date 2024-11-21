import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_fast_ai/config/di.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/cores/utils/flutter_toast.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/base_screen.dart';
import 'image_to_prompt_upload_bloc.dart';
import 'image_to_prompt_upload_event.dart';
import 'image_to_prompt_upload_state.dart';
import 'image_to_prompt_upload_selector.dart';
import 'widgets/content_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/up_load_image_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/bottom_widget.dart';
import 'widgets/upload_image_widget.dart';

class ImageToPromptUploadScreen extends StatefulWidget {
  const ImageToPromptUploadScreen({super.key});

  @override
  State<ImageToPromptUploadScreen> createState() =>
      _ImageToPromptUploadScreenState();
}

class _ImageToPromptUploadScreenState extends State<ImageToPromptUploadScreen>
    with StateFulBaseScreen, CustomFlutterToast {
  String? file;

  final TextEditingController _enterPromptController = TextEditingController();

  final ImageToPromptUploadBloc _bloc = getIt.get<ImageToPromptUploadBloc>();

  @override
  void dispose() {
    _enterPromptController.dispose();
    super.dispose();
  }

  @override
  Widget child(BuildContext context, AppTheme appTheme,
      AppLocalizationManager localization) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ImageToPromptUploadContentWidget(
                  appTheme: appTheme,
                  localization: localization,
                ),
                ImageToPromptUploadFileSelector(
                  builder: (file) {
                    if (file != null) {
                      return ImageToPromptUploadImageWidget(
                        file: file.path,
                        appTheme: appTheme,
                        onRemoveFile: _onRemoveFile,
                      );
                    }

                    return UploadSingleImageWidget(
                      appTheme: appTheme,
                      width: double.maxFinite,
                      onPickImageSuccess: _pickFile,
                      height: context.h * 0.45,
                      label: localization.translate(
                        LanguageKey.recolorImageUploadScreenUpload,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: BoxSize.boxSize05,
                ),
              ],
            ),
          ),
        ),
        ImageToPromptUploadBottomWidget(
          appTheme: appTheme,
          localization: localization,
        ),
      ],
    );
  }

  @override
  Widget wrapBuild(BuildContext context, Widget child, AppTheme appTheme,
      AppLocalizationManager localization) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocListener<ImageToPromptUploadBloc, ImageToPromptUploadState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: _listenStateChange,
        child: Scaffold(
          appBar: NormalAppBar(
            appTheme: appTheme,
            title: localization.translate(
              LanguageKey.imageToPromptUploadScreenAppBarTitle,
            ),
          ),
          body: child,
        ),
      ),
    );
  }

  void _listenStateChange(
    BuildContext context,
    ImageToPromptUploadState state,
  ) {
    switch (state.status) {
      case ImageToPromptUploadStatus.none:
        break;
      case ImageToPromptUploadStatus.generating:
        showLoading();
        break;
      case ImageToPromptUploadStatus.generated:
        hideLoading();
        AppNavigator.push(
          RoutePath.imageToTextFinalize,
          state.tasks,
        );
        break;
      case ImageToPromptUploadStatus.failed:
        showToast(state.error ?? '');
        break;
    }
  }

  void _pickFile(String? filePath) {
    if (filePath == null) return;

    final File file = File(filePath);
    _bloc.add(
      ImageToPromptUploadEventOnPickFile(
        file,
      ),
    );
  }

  void _onRemoveFile() {
    _bloc.add(
      const ImageToPromptUploadEventOnRemoveFile(),
    );
  }
}
