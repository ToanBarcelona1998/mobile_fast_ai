import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/ratio_group_widget.dart';
import 'package:flutter/material.dart';

class TextToPatternEditArtWorkRatioWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final VoidCallback onTap;

  const TextToPatternEditArtWorkRatioWidget({
    required this.appTheme,
    required this.localization,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWithIconWidget(
          title: localization.translate(
            LanguageKey.textToPatternEditArtWorkScreenRatio,
          ),
          appTheme: appTheme,
          icSvgPath: AssetIconPath.icCommonArrowRightActive,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          onSecondChildTap: onTap,
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
