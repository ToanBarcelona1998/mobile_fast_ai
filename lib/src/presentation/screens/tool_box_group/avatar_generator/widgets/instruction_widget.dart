import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class AvatarGeneratorInstructionWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;

  const AvatarGeneratorInstructionWidget({
    required this.appTheme,
    required this.localization,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconWithTextWidget(
          title: localization.translate(
            LanguageKey.aiAvatarScreenGoodPhotos,
          ),
          icSvgPath: AssetIconPath.icAvatarGeneratorGood,
          appTheme: appTheme,
          style: AppTypography.heading6SemiBold.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize07,
        ),
        Text(
          localization.translate(
            LanguageKey.aiAvatarScreenGoodPhotosContent,
          ),
          style: AppTypography.bodyXLargeMedium.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              dummyGoodImages.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.spacing02,
                  ),
                  child: NetworkImageWidget(
                    imageUrl: dummyGoodImages[index],
                    appTheme: appTheme,
                    width: BoxSize.boxSize13,
                    height: BoxSize.boxSize13,
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize07,
        ),
        IconWithTextWidget(
          title: localization.translate(
            LanguageKey.aiAvatarScreenBadPhotos,
          ),
          icSvgPath: AssetIconPath.icAvatarGeneratorBad,
          appTheme: appTheme,
          style: AppTypography.heading6SemiBold.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize07,
        ),
        Text(
          localization.translate(
            LanguageKey.aiAvatarScreenBadPhotosContent,
          ),
          style: AppTypography.bodyXLargeMedium.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              dummyGoodImages.length,
                  (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.spacing02,
                  ),
                  child: NetworkImageWidget(
                    imageUrl: dummyBadImages[index],
                    appTheme: appTheme,
                    width: BoxSize.boxSize13,
                    height: BoxSize.boxSize13,
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
      ],
    );
  }
}
