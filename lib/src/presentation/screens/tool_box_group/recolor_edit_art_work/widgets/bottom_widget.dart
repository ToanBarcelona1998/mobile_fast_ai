import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

class RecolorEditArtWorkBottomWidget extends StatelessWidget {
  final AppLocalizationManager localization;
  final AppTheme appTheme;
  final VoidCallback onReGenerateTap;
  final VoidCallback onDownloadTap;

  const RecolorEditArtWorkBottomWidget({
    required this.appTheme,
    required this.localization,
    required this.onReGenerateTap,
    required this.onDownloadTap,
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
                    LanguageKey.recolorImageEditArtWorkScreenReGenerate,
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
                    LanguageKey.recolorImageEditArtWorkScreenDownload,
                  ),
                  onPress: onDownloadTap,
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
