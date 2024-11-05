import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';

class SignInFormWidget extends StatelessWidget {
  final AppLocalizationManager localization;
  final AppTheme appTheme;
  final VoidCallback onSignInWithPasswordTap;
  final VoidCallback onSignupTap;

  const SignInFormWidget({
    required this.localization,
    required this.appTheme,
    required this.onSignInWithPasswordTap,
    required this.onSignupTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryAppButton(
          text: localization.translate(
            LanguageKey.onBoardingWelcomeScreenSignInWithPassword,
          ),
          onPress: onSignInWithPasswordTap,
        ),
        const SizedBox(
          height: 24,
        ),
        GestureDetector(
          onTap: onSignupTap,
          behavior: HitTestBehavior.opaque,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: localization.translate(
                    LanguageKey.onBoardingWelcomeScreenNoAccount,
                  ),
                  style: AppTypography.bodyLargeMedium.copyWith(
                    color: appTheme.greyScaleColor900,
                  ),
                ),
                TextSpan(
                  text: ' ${localization.translate(
                    LanguageKey.onBoardingWelcomeScreenSignup,
                  )}',
                  style: AppTypography.bodyLargeSemiBold.copyWith(
                    color: appTheme.primaryColor900,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
