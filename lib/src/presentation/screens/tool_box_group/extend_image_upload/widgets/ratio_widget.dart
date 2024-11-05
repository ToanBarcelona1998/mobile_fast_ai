import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:flutter/material.dart';

class ExtendImageUploadRatioWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final TextEditingController widthController;
  final TextEditingController heightController;

  const ExtendImageUploadRatioWidget({
    required this.localization,
    required this.appTheme,
    required this.heightController,
    required this.widthController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization.translate(
            LanguageKey.extendImageUploadScreenExtendRatio,
          ),
          style: AppTypography.heading4Bold.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        CustomDualWidgetRow(
          firstChildWidget: Expanded(
            child: NormalTextInputWidget(
              controller: widthController,
              hintText: localization.translate(
                LanguageKey.extendImageUploadScreenExtendWidth,
              ),
              maxLine: 1,
              keyBoardType: TextInputType.number,
              suffix: Text(
                localization.translate(
                  LanguageKey.extendImageUploadScreenPx,
                ),
                style: AppTypography.heading5Bold.copyWith(
                  color: appTheme.greyScaleColor900,
                ),
              ),
            ),
          ),
          spacing: BoxSize.boxSize04,
          secondChildWidget: Expanded(
            child: NormalTextInputWidget(
              controller: heightController,
              hintText: localization.translate(
                LanguageKey.extendImageUploadScreenExtendWidth,
              ),
              maxLine: 1,
              keyBoardType: TextInputType.number,
              suffix: Text(
                localization.translate(
                  LanguageKey.extendImageUploadScreenPx,
                ),
                style: AppTypography.heading5Bold.copyWith(
                  color: appTheme.greyScaleColor900,
                ),
              ),
            ),
          ),
          appTheme: appTheme,
        ),
      ],
    );
  }
}
