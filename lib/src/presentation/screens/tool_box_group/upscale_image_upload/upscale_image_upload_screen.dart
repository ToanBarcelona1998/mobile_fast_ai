import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_fast_ai/config/di.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/cores/utils/flutter_toast.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'upscale_image_upload_bloc.dart';
import 'upscale_image_upload_state.dart';
import 'upscale_image_upload_event.dart';
import 'upscale_image_upload_selector.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/base_screen.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/up_load_image_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/bottom_widget.dart';
import 'widgets/content_widget.dart';
import 'widgets/upload_image_widget.dart';

class UpscaleImageUploadScreen extends StatefulWidget {
  const UpscaleImageUploadScreen({super.key});

  @override
  State<UpscaleImageUploadScreen> createState() =>
      _UpscaleImageUploadScreenState();
}

class _UpscaleImageUploadScreenState extends State<UpscaleImageUploadScreen>
    with StateFulBaseScreen, CustomFlutterToast {
  final UpscaleImageUploadBloc _bloc = getIt.get<UpscaleImageUploadBloc>();

  String? file;

  @override
  Widget child(BuildContext context, AppTheme appTheme,
      AppLocalizationManager localization) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                UpscaleImageUploadContentWidget(
                  appTheme: appTheme,
                  localization: localization,
                ),
                UpscaleImageUploadFileSelector(
                  builder: (file) {
                    if (file != null) {
                      return SketchToImageUploadImageWidget(
                        file: file.path,
                        appTheme: appTheme,
                        onRemoveFile: _onRemoveFile,
                      );
                    }
                    return UploadSingleImageWidget(
                      appTheme: appTheme,
                      width: double.maxFinite,
                      onPickImageSuccess: _pickFile,
                      label: localization.translate(
                        LanguageKey.upscaleImageUploadScreenUpload,
                      ),
                      height: context.h * 0.45,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        UpscaleImageUploadBottomWidget(
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
      child: BlocListener<UpscaleImageUploadBloc, UpscaleImageUploadState>(
        listener: _listenStateChange,
        listenWhen: (previous, current) => previous.status != current.status,
        child: Scaffold(
          appBar: NormalAppBar(
            appTheme: appTheme,
            title: localization.translate(
              LanguageKey.upscaleImageUploadScreenAppBarTitle,
            ),
          ),
          body: child,
        ),
      ),
    );
  }

  void _listenStateChange(BuildContext context, UpscaleImageUploadState state) {
    switch (state.status) {
      case UpscaleImageUploadStatus.none:
        break;
      case UpscaleImageUploadStatus.upscaling:
        showLoading();
        break;
      case UpscaleImageUploadStatus.done:
        hideLoading();

        AppNavigator.push(
          RoutePath.upscaleImageFinalize,
          state.tasks,
        );
        break;
      case UpscaleImageUploadStatus.failed:
        hideLoading();
        showToast(state.error ?? '');
        break;
    }
  }

  void _pickFile(String? filePath) {
    if (filePath == null) return;

    final File file = File(filePath);
    _bloc.add(
      UpscaleImageUploadEventOnPickFile(
        file,
      ),
    );
  }

  void _onRemoveFile() {
    _bloc.add(
      const UpscaleImageUploadEventOnRemoveFile(),
    );
  }
}
