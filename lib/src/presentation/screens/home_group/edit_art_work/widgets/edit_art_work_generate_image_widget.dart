import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_loading_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditArtWorkGenerateImageWidget extends StatelessWidget {
  final bool loading;
  final String url;
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final VoidCallback onDownLoad;

  const EditArtWorkGenerateImageWidget({
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
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppLoadingWidget(
                  appTheme: appTheme,
                ),
                const SizedBox(
                  height: BoxSize.boxSize05,
                ),
                Text(
                  localization.translate(
                    LanguageKey.editArtWorkScreenGenerating,
                  ),
                  style: AppTypography.heading5Bold.copyWith(
                    color: appTheme.greyScaleColor900,
                  ),
                ),
              ],
            )
          : Stack(
              children: [
                Positioned.fill(
                  child: NetworkImageWidget(
                    imageUrl: url,
                    appTheme: appTheme,
                    width: double.maxFinite,
                  ),
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

class EditArtWorkBoxImageWidget extends StatelessWidget {
  final bool loading;
  final String url;
  final AppTheme appTheme;
  final AppLocalizationManager localization;

  const EditArtWorkBoxImageWidget({
    this.loading = true,
    required this.url,
    required this.localization,
    required this.appTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: BoxSize.boxSize12,
      decoration: BoxDecoration(
        color: appTheme.greyScaleColor100,
        borderRadius: BorderRadius.circular(
          BorderRadiusSize.borderRadius03,
        ),
      ),
      child: loading
          ? const SizedBox.shrink()
          : NetworkImageWidget(
              imageUrl: url,
              appTheme: appTheme,
            ),
    );
  }
}
