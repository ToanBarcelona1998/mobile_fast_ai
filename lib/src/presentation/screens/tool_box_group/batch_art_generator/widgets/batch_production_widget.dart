import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/box_icon_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:flutter/material.dart';

class BatchArtGeneratorProductionWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final int pd;
  final VoidCallback onMinusTap;
  final VoidCallback onPlusTap;

  const BatchArtGeneratorProductionWidget({
    required this.appTheme,
    required this.localization,
    required this.onMinusTap,
    required this.onPlusTap,
    this.pd = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDualWidgetRow(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      firstChildWidget: Text(
        localization.translate(
          LanguageKey.batchArtGeneratorScreenBatchProduction,
        ),
        style: AppTypography.heading4Bold.copyWith(
          color: appTheme.greyScaleColor900,
        ),
      ),
      secondChildWidget: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onMinusTap,
            child: BoxIconWidget(
              iconPath: AssetIconPath.icCommonMinus,
              appTheme: appTheme,
              backgroundColor: appTheme.primaryColor50,
              borderColor: Colors.transparent,
              radius: BorderRadiusSize.borderRadius03,
            ),
          ),
          const SizedBox(
            width: BoxSize.boxSize04,
          ),
          Text(
            pd.toString(),
            style: AppTypography.heading4Bold.copyWith(
              color: appTheme.greyScaleColor900,
            ),
          ),
          const SizedBox(
            width: BoxSize.boxSize04,
          ),
          BoxIconWidget(
            onTap: onPlusTap,
            iconPath: AssetIconPath.icCommonPlus,
            appTheme: appTheme,
            backgroundColor: appTheme.primaryColor50,
            borderColor: Colors.transparent,
            radius: BorderRadiusSize.borderRadius03,
          ),
        ],
      ),
      appTheme: appTheme,
    );
  }
}
