import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/base_screen.dart';
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

class _RemoveBackgroundUploadScreenState extends State<RemoveBackgroundUploadScreen> with StateFulBaseScreen{
  String? file;

  @override
  Widget child(BuildContext context, AppTheme appTheme, AppLocalizationManager localization) {
    return Column(
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
                  RemoveBackgroundUploadContentWidget(
                    appTheme: appTheme,
                    localization: localization,
                  ),
                  file != null
                      ? RemoveBackgroundUploadImageWidget(
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
                          .removeBackgroundUploadScreenUpload,
                    ),
                    height: context.h * 0.45,
                  ),
                ],
              ),
            ),
          ),
        ),
        RemoveBackgroundUploadBottomWidget(
          appTheme: appTheme,
          localization: localization,
          onTap: () {

          },
        ),
      ],
    );
  }

  @override
  Widget wrapBuild(BuildContext context, Widget child, AppTheme appTheme, AppLocalizationManager localization) {
    return Scaffold(
      appBar: NormalAppBar(
        appTheme: appTheme,
        title: localization.translate(
          LanguageKey.removeBackgroundUploadScreenAppBarTitle,
        ),
      ),
      body: child,
    );
  }
}
