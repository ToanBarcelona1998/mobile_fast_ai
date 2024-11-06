import 'dart:io';
import 'package:cache_network_image_extended/cache_network_image_extended.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/cupertino.dart' show CupertinoActivityIndicator;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum PhotoType {
  network,
  file,
  assets,
}

enum ImageType {
  normal,
  svg,
}

const double _defaultHeight = BoxSize.boxSize14;
const double _defaultWidth = BoxSize.boxSize14;

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({
    this.avatarType = PhotoType.network,
    required this.url,
    this.height = _defaultHeight,
    this.width = _defaultWidth,
    this.imageType = ImageType.normal,
    this.fit = BoxFit.cover,
    Key? key,
  }) : super(key: key);
  final PhotoType avatarType;
  final ImageType imageType;
  final String url;
  final double height;
  final double width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CircleRevealClipper(width: width, height: height),
      child: _buildAvatarWithType(),
    );
  }

  Widget _buildAvatarWithType() {
    switch (avatarType) {
      case PhotoType.assets:
        if (imageType == ImageType.normal) {
          return Image(
            image: AssetImage(url),
            fit: fit,
            height: height,
            width: width,
            loadingBuilder: (context, widget, image) => _placeHolder,
          );
        } else {
          return SvgPicture.asset(
            url,
            fit: fit,
            height: height,
            width: width,
            placeholderBuilder: (context) => _placeHolder,
          );
        }
      case PhotoType.network:
        if (imageType == ImageType.normal) {
          return CacheNetworkImageExtend(
            imageUrl: url,
            fit: fit,
            height: height,
            width: width,
            loadingBuilder: (context, url,_) => const CupertinoActivityIndicator(),
            errorBuilder: (context, url, _) => _placeHolder,
            targetWidth: width,
            targetHeight: height,
          );
        } else {
          return SvgPicture.network(
            url,
            fit: fit,
            height: height,
            width: width,
            placeholderBuilder: (ct) => _placeHolder,
          );
        }
      case PhotoType.file:
        if (imageType == ImageType.normal) {
          return Image.file(
            File(url),
            height: height,
            width: width,
            fit: fit,
            errorBuilder: (context, obj, error) => _placeHolder,
          );
        } else {
          return SvgPicture.file(
            File(url),
            height: height,
            width: width,
            fit: fit,
            placeholderBuilder: (ct) => _placeHolder,
          );
        }
    }
  }

  Widget get _placeHolder => SvgPicture.asset(
        AssetImagePath.commonDefaultAvatar,
        width: width,
        height: height,
        fit: fit,
      );
}

class CircleRevealClipper extends CustomClipper<Path> {
  final double width;
  final double height;

  CircleRevealClipper({
    required this.width,
    required this.height,
  });

  @override
  Path getClip(Size size) {
    Path path = Path();

    final Offset center = Offset(width / 2, height / 2);

    final double radius = height / 2;

    path.addOval(Rect.fromCircle(center: center, radius: radius));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
