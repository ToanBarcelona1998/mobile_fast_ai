import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/switch_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_box_widget.dart';
import 'package:flutter/material.dart';

class ImageGeneratorFinalizeContentWidget extends StatelessWidget {
  final AppLocalizationManager localization;
  final AppTheme appTheme;
  final String title;
  final String showPromptTitle;
  final String showNegativePromptTitle;
  final String showCFGTitle;
  final String showSeedTitle;

  const ImageGeneratorFinalizeContentWidget({
    required this.title,
    required this.showPromptTitle,
    required this.showNegativePromptTitle,
    required this.showCFGTitle,
    required this.showSeedTitle,
    required this.appTheme,
    required this.localization,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextBoxWithLabel(
          text: title,
          appTheme: appTheme,
          labelWidget: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: localization.translate(
                    LanguageKey.imageGeneratorFinalizeScreenAddTitle,
                  ),
                  style: AppTypography.heading5Bold.copyWith(
                    color: appTheme.greyScaleColor900,
                  ),
                ),
                TextSpan(
                  text: ' (${localization.translate(
                    LanguageKey.imageGeneratorFinalizeScreenOptional,
                  )})',
                  style: AppTypography.bodyLargeRegular.copyWith(
                    color: appTheme.greyScaleColor700,
                  )
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        TextBoxWithLabel(
          text: showPromptTitle,
          appTheme: appTheme,
          labelWidget: FlexibleDualWidgetRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            firstChildWidget: Text(
              localization.translate(
                LanguageKey.imageGeneratorFinalizeScreenShowPrompt,
              ),
              style: AppTypography.heading5Bold.copyWith(
                color: appTheme.greyScaleColor900,
              ),
            ),
            secondChildWidget: SwitchWidget(
              onChanged: (p0) {},
              isSelected: true,
              appTheme: appTheme,
            ),
            appTheme: appTheme,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        TextBoxWithLabel(
          text: showNegativePromptTitle,
          appTheme: appTheme,
          labelWidget: FlexibleDualWidgetRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            firstChildWidget: Text(
              localization.translate(
                LanguageKey.imageGeneratorFinalizeScreenShowNegativePrompt,
              ),
              style: AppTypography.heading5Bold.copyWith(
                color: appTheme.greyScaleColor900,
              ),
            ),
            secondChildWidget: SwitchWidget(
              onChanged: (p0) {},
              isSelected: true,
              appTheme: appTheme,
            ),
            appTheme: appTheme,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        TextBoxWithLabel(
          text: showCFGTitle,
          appTheme: appTheme,
          labelWidget: FlexibleDualWidgetRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            firstChildWidget: Text(
              localization.translate(
                LanguageKey.imageGeneratorFinalizeScreenShowCFGScale,
              ),
              style: AppTypography.heading5Bold.copyWith(
                color: appTheme.greyScaleColor900,
              ),
            ),
            secondChildWidget: SwitchWidget(
              onChanged: (p0) {},
              isSelected: true,
              appTheme: appTheme,
            ),
            appTheme: appTheme,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        TextBoxWithLabel(
          text: showSeedTitle,
          appTheme: appTheme,
          labelWidget: FlexibleDualWidgetRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            firstChildWidget: Text(
              localization.translate(
                LanguageKey.imageGeneratorFinalizeScreenShowSeed,
              ),
              style: AppTypography.heading5Bold.copyWith(
                color: appTheme.greyScaleColor900,
              ),
            ),
            secondChildWidget: SwitchWidget(
              onChanged: (p0) {},
              isSelected: true,
              appTheme: appTheme,
            ),
            appTheme: appTheme,
          ),
        ),
      ],
    );
  }
}
