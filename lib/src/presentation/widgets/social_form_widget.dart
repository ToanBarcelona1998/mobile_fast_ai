import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/box_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialFormWidget extends StatelessWidget {
  final AppLocalizationManager localization;
  final VoidCallback onGoogleTap;
  final VoidCallback onAppleTap;
  final VoidCallback onFacebookTap;
  final VoidCallback onTwitterTap;

  const SocialFormWidget({
    required this.localization,
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
        BorderAppButton(
          text: localization.translate(
            LanguageKey.globalLoginWithGoogle,
          ),
          leading: SvgPicture.asset(
            AssetIconPath.icCommonGoogle,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        BorderAppButton(
          text: localization.translate(
            LanguageKey.globalLoginWithApple,
          ),
          leading: SvgPicture.asset(
            AssetIconPath.icCommonApple,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        BorderAppButton(
          text: localization.translate(
            LanguageKey.globalLoginWithFacebook,
          ),
          leading: SvgPicture.asset(
            AssetIconPath.icCommonFacebook,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        BorderAppButton(
          text: localization.translate(
            LanguageKey.globalLoginWithTwitter,
          ),
          leading: SvgPicture.asset(
            AssetIconPath.icCommonTwitter,
          ),
        ),
      ],
    );
  }
}

class SocialFormWithOnlyIconWidget extends StatelessWidget {
  final AppTheme appTheme;
  final VoidCallback onGoogleTap;
  final VoidCallback onAppleTap;
  final VoidCallback onFacebookTap;
  final VoidCallback onTwitterTap;

  const SocialFormWithOnlyIconWidget({
    required this.appTheme,
    required this.onGoogleTap,
    required this.onAppleTap,
    required this.onFacebookTap,
    required this.onTwitterTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BoxIconWidget(
            iconPath: AssetIconPath.icCommonGoogle,
            appTheme: appTheme,
            onTap: onGoogleTap,
          ),
        ),
        const SizedBox(
          width: BoxSize.boxSize04,
        ),
        Expanded(
          child: BoxIconWidget(
            iconPath: AssetIconPath.icCommonApple,
            appTheme: appTheme,
            onTap: onAppleTap,
          ),
        ),
        const SizedBox(
          width: BoxSize.boxSize04,
        ),
        Expanded(
          child: BoxIconWidget(
            iconPath: AssetIconPath.icCommonFacebook,
            appTheme: appTheme,
            onTap: onFacebookTap,
          ),
        ),
        const SizedBox(
          width: BoxSize.boxSize04,
        ),
        Expanded(
          child: BoxIconWidget(
            iconPath: AssetIconPath.icCommonTwitter,
            appTheme: appTheme,
            onTap: onTwitterTap,
          ),
        ),
      ],
    );
  }
}
