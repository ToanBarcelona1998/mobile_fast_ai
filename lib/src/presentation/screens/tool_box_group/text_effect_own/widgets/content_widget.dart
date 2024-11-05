import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:flutter/material.dart';

class TextEffectOwnContentWidget extends StatelessWidget {
  final TextEditingController textEffectController;
  final TextEditingController describeController;
  final AppLocalizationManager localization;
  final AppTheme appTheme;

  const TextEffectOwnContentWidget({
    required this.describeController,
    required this.textEffectController,
    required this.localization,
    required this.appTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.spacing05,
        vertical: Spacing.spacing07,
      ),
      child: Column(
        children: [
          TextInputWithBoxFormWidget(
            boxConstraints: const BoxConstraints(
              maxHeight: BoxSize.boxSize16,
              minHeight: BoxSize.boxSize16,
            ),
            hintText: localization.translate(
              LanguageKey.textEffectOwnScreenYourTextHint,
            ),
            hintStyle: AppTypography.heading1Bold.copyWith(
              color: appTheme.greyScaleColor300,
            ),
            textStyle: AppTypography.heading1Bold.copyWith(
              color: appTheme.greyScaleColor900,
            ),
            controller: textEffectController,
            textAlign: TextAlign.center,
            enableInputConstraint: false,
          ),
          const SizedBox(
            height: BoxSize.boxSize05,
          ),
          TextInputWithBoxFormWidget(
            boxConstraints: const BoxConstraints(
              maxHeight: BoxSize.boxSize16,
              minHeight: BoxSize.boxSize16,
            ),
            hintText: localization.translate(
              LanguageKey.textEffectOwnScreenDescribeHint,
            ),
            controller: describeController,
            label: localization.translate(
              LanguageKey.textEffectOwnScreenDescribeLabel,
            ),
          ),
        ],
      ),
    );
  }
}
