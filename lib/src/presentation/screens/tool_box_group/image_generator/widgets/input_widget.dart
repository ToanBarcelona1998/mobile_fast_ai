import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/image_generator/image_generator_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/image_generator/image_generator_event.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/image_generator/image_generator_selector.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/slider_base_widget.dart';
import 'package:flutter/material.dart';

class ImageGeneratorInputWidget extends StatelessWidget {
  final AppLocalizationManager localization;
  final AppTheme appTheme;
  final int maxCFG;
  final int minCFG;

  const ImageGeneratorInputWidget({
    required this.appTheme,
    required this.localization,
    required this.maxCFG,
    required this.minCFG,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization.translate(
            LanguageKey.imageGeneratorScreenCFGScale,
          ),
          style: AppTypography.heading5Bold.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize02,
        ),
        ImageGeneratorCFGScaleSelector(
          builder: (cfg) {
            return CustomSingleSlider(
              appTheme: appTheme,
              current: cfg,
              onChange: (value) {
                _onCFGScaleChange(context, value);
              },
              max: maxCFG.toDouble(),
              min: minCFG.toDouble(),
            );
          },
        ),
      ],
    );
  }

  void _onCFGScaleChange(BuildContext context, double cfgScale) {
    ImageGeneratorBloc.of(context).add(
      ImageGeneratorEventOnCFGScaleChange(
        cfgScale,
      ),
    );
  }
}
