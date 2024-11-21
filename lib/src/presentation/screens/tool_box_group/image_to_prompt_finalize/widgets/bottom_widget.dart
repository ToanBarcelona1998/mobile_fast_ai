import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

class ImageToPromptFinalizeBottomWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final VoidCallback onDownloadArt;
  final VoidCallback onShareToFeed;

  const ImageToPromptFinalizeBottomWidget({
    required this.appTheme,
    required this.localization,
    required this.onDownloadArt,
    required this.onShareToFeed,
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
        Row(
          children: [
            Expanded(
              child: PrimaryAppButton(
                text: localization.translate(
                  LanguageKey.imageToPromptFinalizeScreenDownloadArt,
                ),
                backGroundColor: appTheme.primaryColor100,
                textStyle: AppTypography.bodyXLargeSemiBold.copyWith(
                  color: appTheme.primaryColor900,
                ),
                onPress: onDownloadArt,
              ),
            ),
            const SizedBox(
              width: BoxSize.boxSize04,
            ),
            Expanded(
              child: PrimaryAppButton(
                text: localization.translate(
                  LanguageKey.imageToPromptFinalizeScreenShareToFeed,
                ),
                onPress: onShareToFeed,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
      ],
    );
  }
}
