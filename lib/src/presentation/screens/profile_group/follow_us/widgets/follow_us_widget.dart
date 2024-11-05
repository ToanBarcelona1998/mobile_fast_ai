import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FollowUsWidget extends StatelessWidget {
  final AppTheme appTheme;
  final String text;
  final String icPath;
  final VoidCallback onTap;
  final Color backGroundColor;

  const FollowUsWidget({
    required this.appTheme,
    required this.text,
    required this.icPath,
    required this.onTap,
    required this.backGroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(
          Spacing.spacing06,
        ),
        margin: const EdgeInsets.only(
          bottom: BoxSize.boxSize05,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            BorderRadiusSize.borderRadius04,
          ),
          color: backGroundColor,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icPath,
            ),
            const SizedBox(
              width: BoxSize.boxSize04,
            ),
            Expanded(
              child: Text(
                text,
                style: AppTypography.bodyLargeSemiBold.copyWith(
                  color: appTheme.otherColorWhite,
                ),
              ),
            ),
            const SizedBox(
              width: BoxSize.boxSize04,
            ),
            SvgPicture.asset(
              AssetIconPath.icCommonArrowNext,
              color: appTheme.otherColorWhite,
            ),
          ],
        ),
      ),
    );
  }
}
