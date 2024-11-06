import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

class BottomFormWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final VoidCallback onSkip;
  final VoidCallback onNext;
  final VoidCallback onGetStarted;
  final bool isEndWalkThrough;

  const BottomFormWidget({
    required this.appTheme,
    required this.localization,
    required this.onSkip,
    required this.onNext,
    required this.onGetStarted,
    required this.isEndWalkThrough,
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
            horizontal: BoxSize.boxSize05,
          ),
          child: isEndWalkThrough
              ? PrimaryAppButton(
                  text: localization.translate(
                    LanguageKey.onBoardingWalkThroughScreenGetStarted,
                  ),
                  onPress: onGetStarted,
                )
              : Row(
                  children: [
                    Expanded(
                      child: PrimaryAppButton(
                        text: localization.translate(
                          LanguageKey.onBoardingWalkThroughScreenSkip,
                        ),
                        onPress: onSkip,
                        backGroundColor: appTheme.primaryColor50,
                        textStyle: AppTypography.bodyLargeSemiBold.copyWith(
                          color: appTheme.primaryColor900,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: BoxSize.boxSize04,
                    ),
                    Expanded(
                      child: PrimaryAppButton(
                        onPress: onNext,
                        text: localization.translate(
                          LanguageKey.onBoardingWalkThroughScreenNext,
                        ),
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
