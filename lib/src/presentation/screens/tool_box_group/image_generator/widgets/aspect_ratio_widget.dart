import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/image_generator/image_generator_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/image_generator/image_generator_event.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/image_generator/image_generator_selector.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/ratio_group_widget.dart';
import 'package:flutter/material.dart';

class ImageGeneratorAspectRatioWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;

  const ImageGeneratorAspectRatioWidget({
    required this.appTheme,
    required this.localization,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization.translate(
            LanguageKey.imageGeneratorScreenAspectRatio,
          ),
          style: AppTypography.heading4Bold.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        ImageGeneratorRatioSelector(
          builder: (ratio) {
            return RatioGroupWidget(
              appTheme: appTheme,
              selectedValue: ratio,
              onChanged: (value) {
                _onRatioChange(context,value);
              },
            );
          }
        ),
      ],
    );
  }

  void _onRatioChange(BuildContext context, int ratio) {
    ImageGeneratorBloc.of(context).add(
      ImageGeneratorEventOnChangeRatio(
        ratio,
      ),
    );
  }
}
