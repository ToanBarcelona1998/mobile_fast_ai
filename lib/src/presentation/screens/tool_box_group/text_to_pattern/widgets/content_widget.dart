import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/ratio_group_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:flutter/material.dart';

class TextToPatternContentWidget extends StatelessWidget {
  final AppLocalizationManager localization;
  final AppTheme appTheme;
  final TextEditingController promptController;

  const TextToPatternContentWidget({
    required this.appTheme,
    required this.localization,
    required this.promptController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextInputWithBoxFormWidget(
          boxConstraints: const BoxConstraints(
            maxHeight: BoxSize.boxSize16,
            minHeight: BoxSize.boxSize16,
          ),
          hintText: localization.translate(
            LanguageKey.textToPatternScreenEnterPromptHint,
          ),
          controller: promptController,
          label: localization.translate(
            LanguageKey.textToPatternScreenEnterPrompt,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        TextWithIconWidget(
          title: localization.translate(
            LanguageKey.textToPatternScreenRatio,
          ),
          appTheme: appTheme,
          icSvgPath: AssetIconPath.icCommonArrowRightActive,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          onSecondChildTap: () {

          },
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        RatioGroupWidget(
          appTheme: appTheme,
          selectedValue: 1,
          onChanged: (value) {

          },
        ),
      ],
    );
  }
}
