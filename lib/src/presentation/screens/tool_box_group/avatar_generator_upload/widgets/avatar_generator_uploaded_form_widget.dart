import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/combined_gridview.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvatarGeneratorUploadedFormWidget extends StatelessWidget {
  final List<String> images;
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final VoidCallback onGenerateMore;
  final VoidCallback onDownloadAll;
  final void Function(String) onDownLoad;

  const AvatarGeneratorUploadedFormWidget({
    required this.appTheme,
    required this.localization,
    required this.images,
    required this.onGenerateMore,
    required this.onDownloadAll,
    required this.onDownLoad,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.spacing05,
              vertical: Spacing.spacing07,
            ),
            child: CombinedGridView(
              childCount: 2,
              onRefresh: () {
                //
              },
              onLoadMore: () {
                //
              },
              data: images,
              builder: (url, __) {
                return Stack(
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
                        onTap: () {
                          onDownLoad.call(url);
                        },
                        child: SvgPicture.asset(
                          AssetIconPath.icEditArtWorkDownload,
                        ),
                      ),
                    ),
                  ],
                );
              },
              canLoadMore: false,
              childAspectRatio: 1,
              crossAxisSpacing: Spacing.spacing04,
              mainAxisSpacing: Spacing.spacing05,
            ),
          ),
        ),
        HoLiZonTalDividerWidget(
          appTheme: appTheme,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.spacing05,
          ),
          child: Row(
            children: [
              Expanded(
                child: PrimaryAppButton(
                  text: localization.translate(
                    LanguageKey.aiAvatarUploadScreenGeneratedMore,
                  ),
                  textStyle: AppTypography.bodyLargeSemiBold.copyWith(
                    color: appTheme.primaryColor900,
                  ),
                  backGroundColor: appTheme.primaryColor50,
                  onPress: onGenerateMore,
                ),
              ),
              const SizedBox(
                width: BoxSize.boxSize04,
              ),
              Expanded(
                child: PrimaryAppButton(
                  text: localization.translate(
                    LanguageKey.aiAvatarUploadScreenGeneratedDownloadAll,
                  ),
                  onPress: onDownloadAll,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
      ],
    );
  }
}
