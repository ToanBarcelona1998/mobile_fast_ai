import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimeGeneratorEnterPromptWidget extends StatelessWidget {
  final TextEditingController promptController;
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final VoidCallback onTap;

  const AnimeGeneratorEnterPromptWidget({
    required this.appTheme,
    required this.localization,
    required this.promptController,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlexibleDualWidgetRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          onSecondChildTap: onTap,
          firstChildWidget: Text(
            localization.translate(
              LanguageKey.animeGeneratorScreenEnterPrompt,
            ),
            style: AppTypography.heading4Bold.copyWith(
              color: appTheme.greyScaleColor900,
            ),
          ),
          secondChildWidget: Row(
            children: [
              Text(
                localization.translate(
                  LanguageKey.animeGeneratorScreenEnterPrompt,
                ),
                style: AppTypography.bodyLargeSemiBold.copyWith(
                  color: appTheme.primaryColor900,
                ),
              ),
              const SizedBox(
                width: BoxSize.boxSize04,
              ),
              SvgPicture.asset(
                AssetIconPath.icCommonArrowRightActive,
              ),
            ],
          ),
          appTheme: appTheme,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        Container(
          padding: const EdgeInsets.all(
            Spacing.spacing06,
          ),
          decoration: BoxDecoration(
            color: appTheme.greyScaleColor50,
            borderRadius: BorderRadius.circular(
              BorderRadiusSize.borderRadius03,
            ),
          ),
          child: TextInputOnlyTextFieldWidget(
            boxConstraints: const BoxConstraints(
              maxHeight: BoxSize.boxSize16,
              minHeight: BoxSize.boxSize16,
            ),
            controller: promptController,
            hintText: localization.translate(
              LanguageKey.animeGeneratorScreenTypePromptHint,
            ),
          ),
        ),
      ],
    );
  }
}
