import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

class SignupPersonalInfoBottomWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final VoidCallback onSkip;
  final VoidCallback onContinue;

  const SignupPersonalInfoBottomWidget({
    required this.appTheme,
    required this.localization,
    required this.onSkip,
    required this.onContinue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HoLiZonTalDividerWidget(
          appTheme: appTheme,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.spacing05,
            vertical: Spacing.spacing07,
          ),
          child: Row(
            children: [
              Expanded(
                child: PrimaryAppButton(
                  backGroundColor: appTheme.primaryColor50,
                  textStyle: AppTypography.bodyLargeSemiBold.copyWith(
                    color: appTheme.primaryColor900,
                  ),
                  text: localization.translate(
                    LanguageKey.onBoardingSignupPersonalInfoScreenSkip,
                  ),
                  onPress: onSkip,
                ),
              ),
              const SizedBox(
                width: BoxSize.boxSize04,
              ),
              Expanded(
                child: PrimaryAppButton(
                  text: localization.translate(
                    LanguageKey.onBoardingSignupPersonalInfoScreenContinue,
                  ),
                  onPress: onContinue,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
