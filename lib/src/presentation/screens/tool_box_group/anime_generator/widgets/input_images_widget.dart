import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/up_load_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimeGeneratorInputImagesWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;

  const AnimeGeneratorInputImagesWidget({
    required this.localization,
    required this.appTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlexibleDualWidgetRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          firstChildWidget: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: localization.translate(
                    LanguageKey.animeGeneratorScreenInputImages,
                  ),
                  style: AppTypography.heading4Bold.copyWith(
                    color: appTheme.greyScaleColor900,
                  ),
                ),
                TextSpan(
                  text: ' (${localization.translate(
                    LanguageKey.animeGeneratorScreenOptional,
                  )})',
                  style: AppTypography.bodyXLargeRegular.copyWith(
                    color: appTheme.greyScaleColor700,
                  ),
                ),
              ],
            ),
          ),
          secondChildWidget: SvgPicture.asset(
            AssetIconPath.icCommonArrowRightActive,
          ),
          appTheme: appTheme,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              UploadMultiImageWidget(
                appTheme: appTheme,
                label: localization.translate(
                  LanguageKey.animeGeneratorScreenUpload,
                ),
                onPickImageSuccess: (files) {},
              ),
              const SizedBox(
                width: Spacing.spacing02,
              ),
              Row(
                children: List.generate(
                  4,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.spacing02,
                      ),
                      child: NetworkImageWidget(
                        imageUrl: randomDummyImg(),
                        appTheme: appTheme,
                      ),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        )
      ],
    );
  }
}
