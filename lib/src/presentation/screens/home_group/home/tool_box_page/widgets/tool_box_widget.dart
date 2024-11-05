import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ToolBoxWidget extends StatelessWidget {
  final String url;
  final String title;
  final String description;
  final AppTheme appTheme;
  final VoidCallback onTap;

  const ToolBoxWidget({
    required this.title,
    required this.url,
    required this.description,
    required this.appTheme,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NetworkImageWidget(
            imageUrl: url,
            appTheme: appTheme,
            width: BoxSize.boxSize13,
            height: BoxSize.boxSize13,
          ),
          const SizedBox(
            width: BoxSize.boxSize04,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTypography.heading5Bold.copyWith(
                    color: appTheme.greyScaleColor900,
                  ),
                ),
                const SizedBox(
                  height: BoxSize.boxSize03,
                ),
                Text(
                  description,
                  style: AppTypography.bodyRegularRegular.copyWith(
                    color: appTheme.greyScaleColor900,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: BoxSize.boxSize04,
          ),
          SvgPicture.asset(
            AssetIconPath.icCommonArrowNext,
          ),
        ],
      ),
    );
  }
}
