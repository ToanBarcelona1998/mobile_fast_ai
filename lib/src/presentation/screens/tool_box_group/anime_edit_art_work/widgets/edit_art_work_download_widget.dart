import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bottom_sheet_provider.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final class EditArtWorkDownLoadWidget extends AppBottomSheetProviderWidget {
  final AppLocalizationManager localization;

  // Maybe replace with your data
  final List<String> downloadOptions;

  const EditArtWorkDownLoadWidget({
    required super.appTheme,
    required this.localization,
    required this.downloadOptions,
    super.fit = ChoiceModalFit.fill,
    super.key,
  });

  @override
  Widget? bottomBuilder(BuildContext context, AppTheme appTheme) {
    return null;
  }

  @override
  Widget contentBuilder(BuildContext context, AppTheme appTheme) {
    return Column(
      children: downloadOptions.map(
        (option) {
          return GestureDetector(
            onTap: () => AppNavigator.pop(option),
            behavior: HitTestBehavior.opaque,
            child: Column(
              children: [
                FlexibleDualWidgetRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  firstChildWidget: Text(
                    option,
                    style: AppTypography.heading5SemiBold.copyWith(
                      color: appTheme.greyScaleColor900,
                    ),
                  ),
                  secondChildWidget: SvgPicture.asset(
                    AssetIconPath.icCommonArrowNext,
                  ),
                  appTheme: appTheme,
                ),
                const SizedBox(
                  height: BoxSize.boxSize05,
                ),
                HoLiZonTalDividerWidget(
                  appTheme: appTheme,
                ),
                const SizedBox(
                  height: BoxSize.boxSize05,
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }

  @override
  Widget? titleBuilder(BuildContext context, AppTheme appTheme) {
    return Center(
      child: Text(
        localization.translate(
          LanguageKey.animeEditArtWorkScreenDownload,
        ),
        style: AppTypography.heading4Bold.copyWith(
          color: appTheme.greyScaleColor900,
        ),
      ),
    );
  }
}
