import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/material.dart';

class PhotoToAnimeUploadContentWidget extends StatelessWidget {
  final AppLocalizationManager localization;
  final AppTheme appTheme;

  const PhotoToAnimeUploadContentWidget({
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
            LanguageKey.photoToAnimeUploadScreenTitle,
          ),
          style: AppTypography.heading3Bold.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize04,
        ),
        Text(
          localization.translate(
            LanguageKey.photoToAnimeUploadScreenContent,
          ),
          style: AppTypography.bodyXLargeRegular.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize07,
        ),
      ],
    );
  }
}
