import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:flutter/material.dart';

class HoLiZonTalDividerWidget extends StatelessWidget {
  final Color? dividerColor;
  final double? width;
  final double height;
  final AppTheme appTheme;

  const HoLiZonTalDividerWidget({
    this.dividerColor,
    this.width,
    this.height = 1,
    required this.appTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      color: dividerColor ?? appTheme.greyScaleColor200,
      height: height,
      width: width,
    );
  }
}

class HoLiZonTalDividerWithTextWidget extends StatelessWidget {
  final String text;
  final Color? dividerColor;
  final AppTheme appTheme;
  final double size;

  const HoLiZonTalDividerWithTextWidget({
    super.key,
    required this.text,
    this.dividerColor,
    required this.appTheme,
     this.size = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: dividerColor ?? appTheme.greyScaleColor200,
              height: size,
              margin: const EdgeInsets.only(
                right: 12,
              ),
            ),
          ),
          Text(
            text,
            style: AppTypography.heading6Medium.copyWith(
              color: appTheme.greyScaleColor500,
            ),
          ),
          Expanded(
            child: Container(
              color: dividerColor ?? appTheme.greyScaleColor200,
              height: size,
              margin: const EdgeInsets.only(
                left: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
