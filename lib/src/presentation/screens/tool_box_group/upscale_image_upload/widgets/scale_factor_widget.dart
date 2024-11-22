import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/upscale_image_upload/upscale_image_upload_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/upscale_image_upload/upscale_image_upload_event.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/upscale_image_upload/upscale_image_upload_selector.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/box_icon_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:flutter/material.dart';

class UpscaleImageUploadScaleFactorWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;

  const UpscaleImageUploadScaleFactorWidget({
    required this.appTheme,
    required this.localization,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDualWidgetRow(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      firstChildWidget: Text(
        localization.translate(
          LanguageKey.upscaleImageUploadScreenScaleFactor,
        ),
        style: AppTypography.heading4Bold.copyWith(
          color: appTheme.greyScaleColor900,
        ),
      ),
      secondChildWidget: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => _onMinusTap(context),
            child: BoxIconWidget(
              iconPath: AssetIconPath.icCommonMinus,
              appTheme: appTheme,
              backgroundColor: appTheme.primaryColor50,
              borderColor: Colors.transparent,
              radius: BorderRadiusSize.borderRadius03,
            ),
          ),
          const SizedBox(
            width: BoxSize.boxSize04,
          ),
          UpscaleImageUploadScaleFactorSelector(
            builder: (scaleFactor) {
              return Text(
                scaleFactor.toString(),
                style: AppTypography.heading4Bold.copyWith(
                  color: appTheme.greyScaleColor900,
                ),
              );
            },
          ),
          const SizedBox(
            width: BoxSize.boxSize04,
          ),
          BoxIconWidget(
            onTap: () => _onPlusTap(context),
            iconPath: AssetIconPath.icCommonPlus,
            appTheme: appTheme,
            backgroundColor: appTheme.primaryColor50,
            borderColor: Colors.transparent,
            radius: BorderRadiusSize.borderRadius03,
          ),
        ],
      ),
      appTheme: appTheme,
    );
  }

  void _onPlusTap(BuildContext context) {
    UpscaleImageUploadBloc.of(context).add(
      const UpscaleImageUploadEventOnChangeScaleFactor(
        1,
      ),
    );
  }

  void _onMinusTap(BuildContext context) {
    UpscaleImageUploadBloc.of(context).add(
      const UpscaleImageUploadEventOnChangeScaleFactor(
        -1,
      ),
    );
  }
}
