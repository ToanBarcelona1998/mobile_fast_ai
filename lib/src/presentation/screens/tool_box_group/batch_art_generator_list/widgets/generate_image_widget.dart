import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BatchArtGeneratorListImageWidget extends StatelessWidget {
  final String url;
  final AppTheme appTheme;
  final void Function(String) onDownload;

  const BatchArtGeneratorListImageWidget({
    required this.url,
    required this.appTheme,
    required this.onDownload,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Positioned.fill(
          child: NetworkImageWidget(
            imageUrl: url,
            appTheme: appTheme,
            width: double.maxFinite,
            height: double.maxFinite,
          ),
        ),
        Positioned(
          bottom: Spacing.spacing02,
          left: Spacing.spacing02,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              onDownload.call(url);
            },
            child: SvgPicture.asset(
              AssetIconPath.icEditArtWorkDownload,
            ),
          ),
        ),
      ],
    );
  }
}
