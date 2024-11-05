import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bottom_sheet_provider.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/ratio_group_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/slider_base_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:flutter/material.dart';

class EditARtWorkEditInputWidget extends AppBottomSheetProviderWidget {
  final AppLocalizationManager localization;
  final int selectedRatio;
  final int currentCFG;
  final int maxCFG;
  final int minCFG;

  const EditARtWorkEditInputWidget({
    required super.appTheme,
    required this.localization,
    required this.selectedRatio,
    required this.currentCFG,
    required this.maxCFG,
    required this.minCFG,
    super.key,
  });

  @override
  Widget? bottomBuilder(BuildContext context, AppTheme appTheme) {
    return Column(
      children: [
        HoLiZonTalDividerWidget(
          appTheme: appTheme,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        Row(
          children: [
            Expanded(
              child: PrimaryAppButton(
                text: localization.translate(
                  LanguageKey.editArtWorkScreenCancel,
                ),
                backGroundColor: appTheme.primaryColor100,
                textStyle: AppTypography.bodyLargeSemiBold.copyWith(
                  color: appTheme.primaryColor900,
                ),
                onPress: () => AppNavigator.pop(),
              ),
            ),
            const SizedBox(
              width: BoxSize.boxSize04,
            ),
            Expanded(
              child: PrimaryAppButton(
                text: localization.translate(
                  LanguageKey.editArtWorkScreenSave,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget contentBuilder(BuildContext context, AppTheme appTheme) {
    return Column(
      children: [
        TextInputWithBoxFormWidget(
          label: localization.translate(
            LanguageKey.editArtWorkScreenEditPrompt,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        TextInputWithBoxFormWidget(
          label: localization.translate(
            LanguageKey.editArtWorkScreenAddNegativePrompt,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        TextInputWithBoxFormWidget(
          label: localization.translate(
            LanguageKey.editArtWorkScreenSeed,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        Text(
          localization.translate(
            LanguageKey.editArtWorkScreenAspectRatio,
          ),
          style: AppTypography.heading5Bold.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize02,
        ),
        RatioGroupWidget(
          appTheme: appTheme,
          selectedValue: selectedRatio,
          onChanged: (value) {},
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        Text(
          localization.translate(
            LanguageKey.editArtWorkScreenCFGScale,
          ),
          style: AppTypography.heading5Bold.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize02,
        ),
        CustomSingleSlider(
          appTheme: appTheme,
          current: currentCFG.toDouble(),
          onChange: (value) {},
          max: maxCFG.toDouble(),
          min: minCFG.toDouble(),
        ),
      ],
    );
  }

  @override
  Widget? titleBuilder(BuildContext context, AppTheme appTheme) {
    return Text(
      localization.translate(
        LanguageKey.editArtWorkScreenEditInput,
      ),
      style: AppTypography.heading4Bold.copyWith(
        color: appTheme.greyScaleColor900,
      ),
    );
  }
}
