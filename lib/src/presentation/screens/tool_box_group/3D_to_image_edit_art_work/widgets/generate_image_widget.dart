import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_loading_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThreeDToImageEditArtWorkGenerateImageWidget extends StatelessWidget {
  final bool loading;
  final String url;
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final VoidCallback onDownLoad;

  const ThreeDToImageEditArtWorkGenerateImageWidget({
    this.loading = true,
    required this.url,
    required this.localization,
    required this.appTheme,
    required this.onDownLoad,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: appTheme.greyScaleColor100,
        borderRadius: BorderRadius.circular(
          BorderRadiusSize.borderRadius05,
        ),
      ),
      child: loading
          ? AppLoadingWidget(
              appTheme: appTheme,
            )
          : Stack(
              children: [
                NetworkImageWidget(
                  imageUrl: url,
                  appTheme: appTheme,
                  width: double.maxFinite,
                  height: context.h * 0.45,
                ),
                Positioned(
                  bottom: Spacing.spacing02,
                  left: Spacing.spacing02,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: onDownLoad,
                    child: SvgPicture.asset(
                      AssetIconPath.icEditArtWorkDownload,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class ThreeDToImageEditArtWorkBoxImageWidget extends StatelessWidget {
  final bool loading;
  final bool isSelected;
  final String url;
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final VoidCallback onTap;

  const ThreeDToImageEditArtWorkBoxImageWidget({
    this.loading = true,
    this.isSelected = false,
    required this.url,
    required this.localization,
    required this.appTheme,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        height: BoxSize.boxSize13,
        decoration: BoxDecoration(
          color: appTheme.greyScaleColor100,
          borderRadius: BorderRadius.circular(
            BorderRadiusSize.borderRadius03,
          ),
          border: isSelected
              ? Border.all(
                  color: appTheme.primaryColor900,
                  width: BorderSize.border02,
                )
              : null,
        ),
        child: loading
            ? const SizedBox.shrink()
            : NetworkImageWidget(
                imageUrl: url,
                appTheme: appTheme,
                height: double.maxFinite,
              ),
      ),
    );
  }
}
