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
import 'remove_background_upload_event.dart';
import 'remove_background_upload_state.dart';
import 'remove_background_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/base_screen.dart';
import 'remove_background_upload_selector.dart';
import 'widgets/bottom_widget.dart';
import 'widgets/upload_image_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/up_load_image_widget.dart';
import 'widgets/upload_content_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class RemoveBackgroundUploadScreen extends StatefulWidget {
  const RemoveBackgroundUploadScreen({super.key});

  @override
  State<RemoveBackgroundUploadScreen> createState() =>
      _RemoveBackgroundUploadScreenState();
}

class _RemoveBackgroundUploadScreenState
    extends State<RemoveBackgroundUploadScreen>
    with StateFulBaseScreen, CustomFlutterToast {
  String? file;

  final RemoveBackgroundUploadBloc _bloc =
      getIt.get<RemoveBackgroundUploadBloc>();

  @override
  Widget child(BuildContext context, AppTheme appTheme,
      AppLocalizationManager localization) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                RemoveBackgroundUploadContentWidget(
                  appTheme: appTheme,
                  localization: localization,
                ),
                RemoveBackgroundUploadFileSelector(
                  builder: (file) {
                    if (file != null) {
                      return RemoveBackgroundUploadImageWidget(
                        file: file.path,
                        appTheme: appTheme,
                        onRemoveFile: _onRemoveFile,
                      );
                    }
                    return UploadSingleImageWidget(
                      appTheme: appTheme,
                      width: double.maxFinite,
                      onPickImageSuccess: (file) {
                        _pickFile(file);
                      },
                      label: localization.translate(
                        LanguageKey.removeBackgroundUploadScreenUpload,
                      ),
                      height: context.h * 0.45,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        RemoveBackgroundUploadBottomWidget(
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
      child:
          BlocListener<RemoveBackgroundUploadBloc, RemoveBackgroundUploadState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: _listenStateChange,
        child: Scaffold(
          appBar: NormalAppBar(
            appTheme: appTheme,
            title: localization.translate(
              LanguageKey.removeBackgroundUploadScreenAppBarTitle,
            ),
          ),
          body: child,
        ),
      ),
    );
  }

  void _pickFile(String? filePath) {
    if (filePath == null) return;

    final File file = File(filePath);
    _bloc.add(
      RemoveBackgroundUploadEventOnPickFile(
        file,
      ),
    );
  }

  void _onRemoveFile() {
    _bloc.add(
      const RemoveBackgroundUploadEventOnRemoveFile(),
    );
  }

  void _listenStateChange(
      BuildContext context, RemoveBackgroundUploadState state) {
    switch (state.status) {
      case RemoveBackgroundUploadStatus.none:
        break;
      case RemoveBackgroundUploadStatus.removing:
        showLoading();
        break;
      case RemoveBackgroundUploadStatus.removed:
        hideLoading();

        AppNavigator.push(
          RoutePath.removeBackgroundFinalize,
          state.tasks,
        );
        break;
      case RemoveBackgroundUploadStatus.failed:
        hideLoading();
        showToast(state.error ?? '');
        break;
    }
  }
}
