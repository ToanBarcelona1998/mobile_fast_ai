import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingTitleWidget extends StatelessWidget {
  final String text;
  final AppTheme appTheme;

  const SettingTitleWidget({
    required this.text,
    required this.appTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDualWidgetRow(
      firstChildWidget: Text(
        text,
        style: AppTypography.bodyMediumSemiBold.copyWith(
          color: appTheme.greyScaleColor500,
        ),
      ),
      secondChildWidget: Expanded(
        child: HoLiZonTalDividerWidget(
          appTheme: appTheme,
        ),
      ),
      appTheme: appTheme,
    );
  }
}

class SettingWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final AppLocalizationManager localization;
  final AppTheme appTheme;
  final String svgIconPath;
  final Widget? suffix;

  const SettingWidget({
    required this.text,
    required this.localization,
    required this.onTap,
    required this.appTheme,
    required this.svgIconPath,
    this.suffix,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: CustomDualWidgetRow(
        firstChildWidget: Expanded(
          child: CustomDualWidgetRow(
            firstChildWidget: SvgPicture.asset(
              svgIconPath,
            ),
            secondChildWidget: Expanded(
              child: Text(
                text,
                style: AppTypography.heading6Bold.copyWith(
                  color: appTheme.greyScaleColor900,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            appTheme: appTheme,
          ),
        ),
        secondChildWidget: suffix ??
            SvgPicture.asset(
              AssetIconPath.icCommonArrowNext,
            ),
        appTheme: appTheme,
      ),
    );
  }
}
