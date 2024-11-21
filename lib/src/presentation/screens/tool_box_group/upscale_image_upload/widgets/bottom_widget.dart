import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/upscale_image_upload/upscale_image_upload_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/upscale_image_upload/upscale_image_upload_event.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/upscale_image_upload/upscale_image_upload_selector.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

class UpscaleImageUploadBottomWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;

  const UpscaleImageUploadBottomWidget({
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
        UpscaleImageUploadFileSelector(
          builder: (file) {
            return PrimaryAppButton(
              isDisable: file == null,
              text: localization.translate(
                LanguageKey.upscaleImageUploadScreenGenerate,
              ),
              onPress: () => _onSubmit(context),
            );
          }
        ),
      ],
    );
  }

  void _onSubmit(BuildContext context) {
    UpscaleImageUploadBloc.of(context).add(
      const UpscaleImageUploadEventOnSubmit(),
    );
  }
}
