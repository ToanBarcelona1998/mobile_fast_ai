import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class TextEffectWidget extends StatelessWidget {
  final String thumpUrl;
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final VoidCallback onTryTap;

  const TextEffectWidget({
    required this.thumpUrl,
    required this.appTheme,
    required this.localization,
    required this.onTryTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: NetworkImageWidget(
            imageUrl: thumpUrl,
            appTheme: appTheme,
            width: double.maxFinite,
            height: double.maxFinite,
          ),
        ),
        Positioned(
          bottom: Spacing.spacing02,
          right: Spacing.spacing02,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTryTap,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.spacing04,
                vertical: Spacing.spacing02,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  BorderRadiusSize.borderRadiusRound,
                ),
                color: appTheme.otherColorWhite,
              ),
              alignment: Alignment.center,
              child: Text(
                localization.translate(
                  LanguageKey.textEffectScreenTry,
                ),
                style: AppTypography.bodyMediumSemiBold.copyWith(
                  color: appTheme.primaryColor900,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
