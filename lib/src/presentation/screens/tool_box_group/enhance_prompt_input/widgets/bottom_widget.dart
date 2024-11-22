import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/enhance_prompt_input/enhance_prompt_input_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/enhance_prompt_input/enhance_prompt_input_event.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/enhance_prompt_input/enhance_prompt_input_selector.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

class EnhancePromptInputBottomWidget extends StatelessWidget {
  final AppLocalizationManager localization;
  final AppTheme appTheme;

  const EnhancePromptInputBottomWidget({
    required this.localization,
    required this.appTheme,
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
        EnhancePromptInputIsReadySubmitSelector(
          builder: (isReadySubmit) {
            return PrimaryAppButton(
              isDisable: !isReadySubmit,
              text: localization.translate(
                LanguageKey.enhancePromptInputScreenGenerate,
              ),
              onPress: () => _onSubmit(context),
            );
          }
        ),
      ],
    );
  }

  void _onSubmit(BuildContext context) {
    EnhancePromptInputBloc.of(context).add(
      const EnhancePromptInputEventOnSubmit(),
    );
  }
}
