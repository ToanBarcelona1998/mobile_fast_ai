import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/social_form_widget.dart';
import 'package:flutter/material.dart';

class SubSignupFormWidget extends StatelessWidget {
  final AppLocalizationManager localization;
  final AppTheme appTheme;
  final VoidCallback onSignInTap;
  final VoidCallback onGoogleTap;
  final VoidCallback onAppleTap;
  final VoidCallback onFacebookTap;
  final VoidCallback onTwitterTap;

  const SubSignupFormWidget({
    required this.appTheme,
    required this.localization,
    required this.onSignInTap,
    required this.onGoogleTap,
    required this.onAppleTap,
    required this.onFacebookTap,
    required this.onTwitterTap,
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
          height: BoxSize.boxSize07,
        ),
        GestureDetector(
          onTap: onSignInTap,
          behavior: HitTestBehavior.opaque,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: localization.translate(
                    LanguageKey.onBoardingSignupFormScreenAlreadyAccount,
                  ),
                  style: AppTypography.bodyLargeMedium.copyWith(
                    color: appTheme.greyScaleColor900,
                  ),
                ),
                TextSpan(
                  text: ' ${localization.translate(
                    LanguageKey.onBoardingSignupFormScreenSignIn,
                  )}',
                  style: AppTypography.bodyLargeSemiBold.copyWith(
                    color: appTheme.primaryColor900,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize07,
        ),
        HoLiZonTalDividerWithTextWidget(
          text: localization.translate(
            LanguageKey.onBoardingSignupFormScreenContinue,
          ),
          appTheme: appTheme,
        ),
        const SizedBox(
          height: BoxSize.boxSize07,
        ),
        SocialFormWithOnlyIconWidget(
          appTheme: appTheme,
          onAppleTap: onAppleTap,
          onFacebookTap: onFacebookTap,
          onGoogleTap: onGoogleTap,
          onTwitterTap: onTwitterTap,
        ),
      ],
    );
  }
}
