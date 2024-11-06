import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

class ImageToPaintingEditArtWorkBottomWidget extends StatelessWidget {
  final AppLocalizationManager localization;
  final AppTheme appTheme;
  final VoidCallback onReGenerateTap;
  final VoidCallback onDownloadAllTap;

  const ImageToPaintingEditArtWorkBottomWidget({
    required this.appTheme,
    required this.localization,
    required this.onReGenerateTap,
    required this.onDownloadAllTap,
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
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.spacing05,
          ),
          child: Row(
            children: [
              Expanded(
                child: PrimaryAppButton(
                  text: localization.translate(
                    LanguageKey.imageToPaintingEditArtWorkScreenReGenerate,
                  ),
                  backGroundColor: appTheme.primaryColor50,
                  textStyle: AppTypography.bodyLargeSemiBold.copyWith(
                    color: appTheme.primaryColor900,
                  ),
                  onPress: onReGenerateTap,
                ),
              ),
              const SizedBox(
                width: BoxSize.boxSize04,
              ),
              Expanded(
                child: PrimaryAppButton(
                  text: localization.translate(
                    LanguageKey.imageToPaintingEditArtWorkScreenDownloadAll,
                  ),
                  onPress: onDownloadAllTap,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
      ],
    );
  }
}
