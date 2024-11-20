import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/image_generator/image_generator_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/image_generator/image_generator_event.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/image_generator/image_generator_selector.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

class ImageGeneratorBottomWidget extends StatelessWidget {
  final AppLocalizationManager localization;
  final AppTheme appTheme;

  const ImageGeneratorBottomWidget({
    required this.appTheme,
    required this.localization,
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
        ImageGeneratorIsReadySubmitSelector(
          builder: (isReadySubmit) {
            return PrimaryAppButton(
              isDisable: !isReadySubmit,
              text: localization.translate(
                LanguageKey.imageGeneratorScreenGenerate,
              ),
              onPress: () => _onSubmit(context),
            );
          },
        ),
      ],
    );
  }

  void _onSubmit(BuildContext context) {
    ImageGeneratorBloc.of(context).add(
      const ImageGeneratorEventOnSubmit(),
    );
  }
}
