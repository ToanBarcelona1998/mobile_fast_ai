import 'dart:io';

import 'package:cache_network_image_extended/cache_network_image_extended.dart';
import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:shimmer/shimmer.dart';

abstract class ImageWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final String imageUrl;
  final AppTheme appTheme;
  final BorderRadius? radius;
  final BoxFit fit;

  const ImageWidget({
    required this.imageUrl,
    this.width = BoxSize.boxSize15,
    this.height = BoxSize.boxSize15,
    this.fit = BoxFit.cover,
    required this.appTheme,
    this.radius,
    super.key,
  });

  Widget imageBuilder(BuildContext context, AppTheme appTheme);

  Widget placeholder() {
    return Shimmer.fromColors(
      baseColor: appTheme.primaryColor300,
      highlightColor: appTheme.primaryColor50,
      child: SizedBox(
        width: width,
        height: height,
      ),
    );
  }

  Widget errorWidget() {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: appTheme.primaryColor50,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius ??
          BorderRadius.circular(
            BorderRadiusSize.borderRadius03,
          ),
      child: imageBuilder(context, appTheme),
    );
  }
}

final class NetworkImageWidget extends ImageWidget {
  const NetworkImageWidget({
    required super.imageUrl,
    super.width = BoxSize.boxSize15,
    super.height = BoxSize.boxSize15,
    required super.appTheme,
    super.radius,
    super.fit,
    super.key,
  });

  @override
  Widget imageBuilder(BuildContext context, AppTheme appTheme) {
    return CacheNetworkImageExtend(
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,
      loadingBuilder: (context, url , isLoading) {
        return placeholder();
      },
      errorBuilder: (context, url, error) {
        return errorWidget();
      },
      targetHeight: context.cacheImageTarget,
      targetWidth: context.cacheImageTarget,
    );
  }
}

final class FileImageWidget extends ImageWidget {
  const FileImageWidget({
    required super.imageUrl,
    required super.appTheme,
    super.height,
    super.key,
    super.radius,
    super.width,
    super.fit,
  });

  @override
  Widget imageBuilder(BuildContext context, AppTheme appTheme) {
    return Image.file(
      File(imageUrl),
      height: height,
      width: width,
      fit: fit,
      errorBuilder: (context, obj, error) => errorWidget(),
    );
  }
}

final class SvgAssetImageWidget extends ImageWidget {
  final Color ?backgroundColor;
  const SvgAssetImageWidget({
    required super.imageUrl,
    required super.appTheme,
    super.height,
    super.key,
    super.radius,
    super.width,
    super.fit,
    this.backgroundColor,
  });

  @override
  Widget imageBuilder(BuildContext context, AppTheme appTheme) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      color: backgroundColor ?? appTheme.greyScaleColor100,
      child: SvgPicture.asset(
        imageUrl,
        placeholderBuilder: (context) => placeholder(),
        fit: fit,
      ),
    );
  }
}
