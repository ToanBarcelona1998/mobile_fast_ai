import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:flutter/material.dart';

class AboutContentWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;

  const AboutContentWidget({
    required this.appTheme,
    required this.localization,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        HoLiZonTalDividerWidget(
          appTheme: appTheme,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        _AboutContentWidget(
          appTheme: appTheme,
          text: localization.translate(
            LanguageKey.aboutAppScreenJobVacancy,
          ),
        ),
        _AboutContentWidget(
          appTheme: appTheme,
          text: localization.translate(
            LanguageKey.aboutAppScreenDeveloper,
          ),
        ),
        _AboutContentWidget(
          appTheme: appTheme,
          text: localization.translate(
            LanguageKey.aboutAppScreenPartner,
          ),
        ),
        _AboutContentWidget(
          appTheme: appTheme,
          text: localization.translate(
            LanguageKey.aboutAppScreenAccessibility,
          ),
        ),
        _AboutContentWidget(
          appTheme: appTheme,
          text: localization.translate(
            LanguageKey.aboutAppScreenTerm,
          ),
        ),
        _AboutContentWidget(
          appTheme: appTheme,
          text: localization.translate(
            LanguageKey.aboutAppScreenFeedBack,
          ),
        ),
        _AboutContentWidget(
          appTheme: appTheme,
          text: localization.translate(
            LanguageKey.aboutAppScreenRate,
          ),
        ),
        _AboutContentWidget(
          appTheme: appTheme,
          text: localization.translate(
            LanguageKey.aboutAppScreenWebsite,
          ),
        ),
        _AboutContentWidget(
          appTheme: appTheme,
          text: localization.translate(
            LanguageKey.aboutAppScreenFollowUs,
          ),
        ),
      ],
    );
  }
}

final class _AboutContentWidget extends StatelessWidget {
  final AppTheme appTheme;
  final String text;
  final VoidCallback? onTap;

  const _AboutContentWidget({
    required this.appTheme,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: Spacing.spacing06,
        ),
        child: TextWithIconWidget(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          title: text,
          icSvgPath: AssetIconPath.icCommonArrowNext,
          appTheme: appTheme,
          style: AppTypography.heading5SemiBold.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
      ),
    );
  }
}
