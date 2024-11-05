import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BoxIconWidget extends StatelessWidget {
  final String iconPath;
  final Widget? icon;
  final VoidCallback? onTap;
  final double radius;
  final AppTheme appTheme;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color? borderColor;

  const BoxIconWidget({
    required this.iconPath,
    this.icon,
    this.onTap,
    this.radius = BorderRadiusSize.borderRadiusRound,
    this.padding,
    this.backgroundColor,
    this.borderColor,
    required this.appTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: padding ??
            const EdgeInsets.all(
              Spacing.spacing05,
            ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            radius,
          ),
          border: Border.all(
            color: borderColor ?? appTheme.greyScaleColor200,
          ),
          color: backgroundColor ?? appTheme.otherColorWhite,
        ),
        alignment: Alignment.center,
        child: icon ??
            SvgPicture.asset(
              iconPath,
            ),
      ),
    );
  }
}
