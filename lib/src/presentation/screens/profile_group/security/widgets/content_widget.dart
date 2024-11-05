import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'security_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';

class SecurityContentWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final VoidCallback onChangePassword;

  const SecurityContentWidget({
    required this.appTheme,
    required this.localization,
    required this.onChangePassword,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SecurityWidget(
          appTheme: appTheme,
          text: localization.translate(
            LanguageKey.securityScreenRememberMe,
          ),
          value: true,
          onChanged: (p0) {},
        ),
        SecurityWidget(
          appTheme: appTheme,
          text: localization.translate(
            LanguageKey.securityScreenBiometric,
          ),
          onChanged: (p0) {},
        ),
        SecurityWidget(
          appTheme: appTheme,
          text: localization.translate(
            LanguageKey.securityScreenFaceId,
          ),
          onChanged: (p0) {},
        ),
        SecurityWidget(
          appTheme: appTheme,
          text: localization.translate(
            LanguageKey.securityScreenSms,
          ),
          onChanged: (p0) {},
        ),
        SecurityWidget(
          appTheme: appTheme,
          text: localization.translate(
            LanguageKey.securityScreenGoogle,
          ),
          onChanged: (p0) {},
        ),
        SecurityWidget(
          appTheme: appTheme,
          text: localization.translate(
            LanguageKey.securityScreenDeviceManagement,
          ),
          onChanged: (p0) {},
        ),
        PrimaryAppButton(
          text: localization.translate(
            LanguageKey.securityScreenChangePassword,
          ),
          textStyle: AppTypography.bodyLargeSemiBold.copyWith(
            color: appTheme.primaryColor900,
          ),
          backGroundColor: appTheme.primaryColor50,
          onPress: onChangePassword,
        ),
      ],
    );
  }
}
