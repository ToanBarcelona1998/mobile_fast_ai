import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_loading_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/combined_gridview.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class AvatarGeneratorUploadingFormWidget extends StatelessWidget {
  final List<String> images;
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final VoidCallback onNotify;

  const AvatarGeneratorUploadingFormWidget({
    required this.images,
    required this.localization,
    required this.appTheme,
    required this.onNotify,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Padding(
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
                  builder: (_, __) {
                    return SvgAssetImageWidget(
                      imageUrl: AssetIconPath.icCommonProfile,
                      appTheme: appTheme,
                      width: double.maxFinite,
                    );
                  },
                  canLoadMore: false,
                  childAspectRatio: 1,
                  crossAxisSpacing: Spacing.spacing04,
                  mainAxisSpacing: Spacing.spacing05,
                ),
              ),
              Positioned.fill(
                child: Container(
                  color: appTheme.otherColorWhite.withOpacity(
                    0.1,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppLoadingWidget(),
                      const SizedBox(
                        height: BoxSize.boxSize05,
                      ),
                      Text(
                        localization.translate(
                          LanguageKey.aiAvatarUploadScreenGeneratingTitle,
                        ),
                        style: AppTypography.heading4Bold.copyWith(
                          color: appTheme.greyScaleColor900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: BoxSize.boxSize05,
                      ),
                      Text(
                        localization.translate(
                          LanguageKey.aiAvatarUploadScreenGeneratingContent,
                        ),
                        style: AppTypography.bodyXLargeMedium.copyWith(
                          color: appTheme.greyScaleColor900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
          child: PrimaryAppButton(
            text: localization.translate(
              LanguageKey.aiAvatarUploadScreenUploadingButtonTitle,
            ),
            textStyle: AppTypography.bodyLargeSemiBold.copyWith(
              color: appTheme.primaryColor900,
            ),
            backGroundColor: appTheme.primaryColor50,
            onPress: onNotify,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
      ],
    );
  }
}
