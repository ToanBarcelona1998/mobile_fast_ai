import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/image_generator/image_generator_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/image_generator/image_generator_event.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:flutter/material.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_manager.dart';

class ImageGeneratorEnterPromptWidget extends StatelessWidget {
  final TextEditingController promptController;
  final TextEditingController negativePromptController;
  final AppTheme appTheme;
  final AppLocalizationManager localization;

  const ImageGeneratorEnterPromptWidget({
    required this.appTheme,
    required this.localization,
    required this.promptController,
    required this.negativePromptController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization.translate(
            LanguageKey.imageGeneratorScreenEnterPrompt,
          ),
          style: AppTypography.heading4Bold.copyWith(
            color: appTheme.greyScaleColor900,
          ),
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
              LanguageKey.imageGeneratorScreenTypePromptHint,
            ),
            onChanged: (prompt, _) {
              _onPromptChange(context,prompt);
            },
            maxLine: null,
            constraintManager: ConstraintManager(isStopWhenFirstFailure: true)
              ..maxLength(
                maxLength: 2000,
                errorMessage: localization.translate(
                  LanguageKey.imageGeneratorScreenPromptLenthInValid,
                ),
              )
              ..minLength(
                minLength: 2,
                errorMessage: localization.translate(
                  LanguageKey.imageGeneratorScreenPromptLenthInValid,
                ),
              )
              ..notEmpty(
                errorMessage: localization.translate(
                  LanguageKey.imageGeneratorScreenPromptLenthInValid,
                ),
              ),
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize07,
        ),
        Text(
          localization.translate(
            LanguageKey.imageGeneratorScreenEnterNegativePrompt,
          ),
          style: AppTypography.heading4Bold.copyWith(
            color: appTheme.greyScaleColor900,
          ),
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
              maxHeight: BoxSize.boxSize12,
              minHeight: BoxSize.boxSize12,
            ),
            controller: negativePromptController,
            hintText: localization.translate(
              LanguageKey.imageGeneratorScreenTypeNegativePromptHint,
            ),
            maxLine: null,
            onChanged: (prompt, _) {
              _onNegativePromptChange(context,prompt);
            },
            constraintManager: ConstraintManager()
              ..maxLength(
                maxLength: 2000,
                errorMessage: localization.translate(
                  LanguageKey.imageGeneratorScreenPromptLenthInValid,
                ),
              )
              ..minLength(
                minLength: 2,
                errorMessage: localization.translate(
                  LanguageKey.imageGeneratorScreenPromptLenthInValid,
                ),
              ),
          ),
        ),
      ],
    );
  }

  void _onPromptChange(BuildContext context, String prompt) {
    ImageGeneratorBloc.of(context).add(
      ImageGeneratorEventOnChangePrompt(
        prompt,
      ),
    );
  }

  void _onNegativePromptChange(BuildContext context, String prompt) {
    ImageGeneratorBloc.of(context).add(
      ImageGeneratorEventOnChangeNegativePrompt(
        prompt,
      ),
    );
  }
}
