import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThreeDToImageUploadImageWidget extends StatelessWidget {
  final String file;
  final AppTheme appTheme;
  final VoidCallback onRemoveFile;

  const ThreeDToImageUploadImageWidget({
    required this.file,
    required this.appTheme,
    required this.onRemoveFile,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FileImageWidget(
          imageUrl: file,
          appTheme: appTheme,
          width: double.maxFinite,
          height: context.h * 0.45,
        ),
        Positioned(
          top: Spacing.spacing02,
          right: Spacing.spacing02,
          child: GestureDetector(
            onTap: onRemoveFile,
            child: SvgPicture.asset(
              AssetIconPath.icCommonCloseCircleRed,
            ),
          ),
        ),
      ],
    );
  }
}
