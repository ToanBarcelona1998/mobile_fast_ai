import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopupMenuWidget extends StatelessWidget {
  final AppTheme appTheme;
  final Widget? child;
  final List<PopupMenuItem> children;
  final EdgeInsets ? padding;

  const PopupMenuWidget({
    required this.appTheme,
    this.child,
    this.children = const [],
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(
        horizontal: Spacing.spacing04,
      ),
      child: PopupMenuButton(
        surfaceTintColor: appTheme.bodyBackGroundColor,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            BorderRadiusSize.borderRadius04,
          ),
        ),
        color: appTheme.bodyBackGroundColor,
        itemBuilder: (context) {
          return children;
        },
        child: child ??
            SvgPicture.asset(
              AssetIconPath.icCommonMore,
            ),
      ),
    );
  }
}
