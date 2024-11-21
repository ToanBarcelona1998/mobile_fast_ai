import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/remove_background_upload/remove_background_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/remove_background_upload/remove_background_upload_event.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/remove_background_upload/remove_background_upload_selector.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

class RemoveBackgroundUploadBottomWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;

  const RemoveBackgroundUploadBottomWidget({
    required this.appTheme,
    required this.localization,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HoLiZonTalDividerWidget(
          appTheme: appTheme,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        RemoveBackgroundUploadFileSelector(
          builder: (file) {
            return PrimaryAppButton(
              isDisable: file == null,
              text: localization.translate(
                LanguageKey.removeBackgroundUploadScreenGenerate,
              ),
              onPress: () => _onSubmit(context),
            );
          }
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
      ],
    );
  }

  void _onSubmit(BuildContext context) {
    RemoveBackgroundUploadBloc.of(context).add(
      const RemoveBackgroundUploadEventOnSubmit(),
    );
  }
}
