import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/image_generator/image_generator_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/image_generator/image_generator_event.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/image_generator/image_generator_selector.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/simple_network_image_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageGeneratorModelWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;

  const ImageGeneratorModelWidget({
    required this.localization,
    required this.appTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization.translate(
            LanguageKey.imageGeneratorScreenModel,
          ),
          style: AppTypography.heading4Bold.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ImageGeneratorModelsSelector(
            builder: (models) {
              return Row(
                children: List.generate(
                  models.length,
                  (index) {
                    final model = models[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        right: index == models.length - 1
                            ? Spacing.spacing0
                            : Spacing
                                .spacing04, // clean padding when is the last item
                      ),
                      child: ImageGeneratorSelectedModelSelector(
                        builder: (selectedModel) {
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              _onSelectModel(
                                  context, selectedModel?.id, model.id);
                            },
                            child: SimpleNetworkImageInfoWidget(
                              imgTitle: model.model,
                              imgUrl: model.thumbnail,
                              appTheme: appTheme,
                              fillImg: selectedModel?.id == model.id
                                  ? SvgPicture.asset(
                                      AssetIconPath.icCommonCheck,
                                    )
                                  : null,
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _onSelectModel(BuildContext context, int? selectedId, int id) {
    if (selectedId == id) return;
    ImageGeneratorBloc.of(context).add(
      ImageGeneratorEventOnSelectModel(
        id,
      ),
    );
  }
}
