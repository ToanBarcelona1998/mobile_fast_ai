import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/helpers/image_picker_helper.dart';
import 'package:mobile_fast_ai/src/cores/utils/dart_core_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class _UploadImageWidgetBase<T> extends StatelessWidget {
  final double? height;
  final double? width;
  final AppTheme appTheme;
  final String? label;
  final Widget ?icon;
  final void Function(T picked) onPickImageSuccess;

  const _UploadImageWidgetBase({
    this.width = BoxSize.boxSize15,
    this.height = BoxSize.boxSize15,
    required this.appTheme,
    required this.onPickImageSuccess,
    this.label,
    this.icon,
    super.key,
  });

  void onUpload();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onUpload,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: appTheme.primaryColor50,
          borderRadius: BorderRadius.circular(
            BorderRadiusSize.borderRadius03,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon ?? SvgPicture.asset(
              AssetIconPath.icCommonAddActive,
            ),
            if (label.isNotNullOrEmpty) ...[
              const SizedBox(
                width: BoxSize.boxSize02,
              ),
              Text(
                label!,
                style: AppTypography.bodyMediumSemiBold.copyWith(
                  color: appTheme.primaryColor900,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class UploadMultiImageWidget extends _UploadImageWidgetBase<List<String>> {
  const UploadMultiImageWidget({
    super.width = BoxSize.boxSize15,
    super.height = BoxSize.boxSize15,
    required super.appTheme,
    required super.onPickImageSuccess,
    super.label,
    super.key,
    super.icon,
  });

  @override
  void onUpload() async {
    final List<String> files = await ImagePickerHelper.pickMultiImage();

    if (files.isNotEmpty) {
      onPickImageSuccess(files);
    }
  }
}

class UploadSingleImageWidget extends _UploadImageWidgetBase<String?> {
  const UploadSingleImageWidget({
    super.width = BoxSize.boxSize15,
    super.height = BoxSize.boxSize15,
    required super.appTheme,
    required super.onPickImageSuccess,
    super.label,
    super.key,
    super.icon,
  });

  @override
  void onUpload() async {
    final String? file = await ImagePickerHelper.pickSingleImage();

    onPickImageSuccess(file);
  }
}
