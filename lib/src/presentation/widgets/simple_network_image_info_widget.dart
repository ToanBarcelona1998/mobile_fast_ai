import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class SimpleNetworkImageInfoWidget extends StatelessWidget {
  final String imgTitle;
  final String imgUrl;
  final AppTheme appTheme;
  final double? height;
  final double? width;
  final TextStyle? style;
  final Widget? fillImg;

  const SimpleNetworkImageInfoWidget({
    required this.imgTitle,
    required this.imgUrl,
    required this.appTheme,
    this.width = BoxSize.boxSize15,
    this.height = BoxSize.boxSize15,
    this.style,
    this.fillImg,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            NetworkImageWidget(
              imageUrl: imgUrl,
              appTheme: appTheme,
              width: width,
              height: height,
            ),
            if (fillImg != null)
              Positioned.fill(
                child: fillImg!,
              ),
          ],
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        Text(
          imgTitle,
          style: style ??
              AppTypography.heading6Bold.copyWith(
                color: appTheme.greyScaleColor900,
              ),
        ),
      ],
    );
  }
}

class SimpleNetworkImageFixedColumnInfoWidget extends StatelessWidget {
  final String imgTitle;
  final String imgUrl;
  final AppTheme appTheme;
  final TextStyle? style;
  final Widget? fillImg;

  const SimpleNetworkImageFixedColumnInfoWidget({
    required this.imgTitle,
    required this.imgUrl,
    required this.appTheme,
    this.style,
    this.fillImg,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                child: NetworkImageWidget(
                  imageUrl: imgUrl,
                  appTheme: appTheme,
                  width: null,
                  height: null,
                ),
              ),
              if (fillImg != null)
                Positioned.fill(
                  child: fillImg!,
                ),
            ],
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        Text(
          imgTitle,
          style: style ??
              AppTypography.heading6Bold.copyWith(
                color: appTheme.greyScaleColor900,
              ),
        ),
      ],
    );
  }
}
