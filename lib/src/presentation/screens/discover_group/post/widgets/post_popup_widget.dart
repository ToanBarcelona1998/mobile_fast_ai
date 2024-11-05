import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:flutter/material.dart';

class PostPopupWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  final AppTheme appTheme;
  final bool displayDivider;

  const PostPopupWidget({
    required this.appTheme,
    required this.title,
    required this.iconPath,
    this.displayDivider = true,
    super.key,
  });

  TextStyle get labelStyle => AppTypography.bodyLargeSemiBold.copyWith(
    color: appTheme.greyScaleColor900,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconWithTextWidget(
          title: title,
          icSvgPath: iconPath,
          appTheme: appTheme,
          style: labelStyle,
        ),
        if (displayDivider) ...[
          const SizedBox(
            height: BoxSize.boxSize04,
          ),
          HoLiZonTalDividerWidget(
            appTheme: appTheme,
          ),
          const SizedBox(
            height: BoxSize.boxSize04,
          ),
        ]
      ],
    );
  }
}
