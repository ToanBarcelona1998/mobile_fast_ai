import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LanguageWidget extends StatelessWidget {
  final AppTheme appTheme;
  final String text;
  final bool isSelected;

  const LanguageWidget({
    required this.appTheme,
    required this.text,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: Spacing.spacing07,
      ),
      child: CustomDualWidgetRow(
        firstChildWidget: Expanded(
          child: Text(
            text,
            style: AppTypography.heading6Bold.copyWith(
              color: appTheme.greyScaleColor900,
            ),
          ),
        ),
        secondChildWidget: isSelected
            ? SvgPicture.asset(
                AssetIconPath.icCommonCheck,
              )
            : const SizedBox.shrink(),
        appTheme: appTheme,
      ),
    );
  }
}
