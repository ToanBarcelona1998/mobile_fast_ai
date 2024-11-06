import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bottom_sheet_provider.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class _PostRemixItemWidget extends StatelessWidget {
  final AppTheme appTheme;
  final String iconPath;
  final String title;
  final VoidCallback onTap;

  const _PostRemixItemWidget({
    required this.appTheme,
    required this.title,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HoLiZonTalDividerWidget(
          appTheme: appTheme,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        GestureDetector(
          onTap: onTap,
          behavior: HitTestBehavior.opaque,
          child: CustomDualWidgetRow(
            firstChildWidget: Expanded(
              child: IconWithTextWidget(
                title: title,
                icSvgPath: iconPath,
                appTheme: appTheme,
                style: AppTypography.heading5SemiBold.copyWith(
                  color: appTheme.greyScaleColor900,
                ),
              ),
            ),
            secondChildWidget: SvgPicture.asset(
              AssetIconPath.icCommonArrowNext,
            ),
            appTheme: appTheme,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
      ],
    );
  }
}

class PostRemixWidget extends AppBottomSheetProviderWidget {
  final VoidCallback onUseInputImage;
  final VoidCallback onCreateArtWithPrompt;
  final VoidCallback onTryStyle;
  final AppLocalizationManager localization;

  const PostRemixWidget({
    required super.appTheme,
    required this.localization,
    required this.onUseInputImage,
    required this.onCreateArtWithPrompt,
    required this.onTryStyle,
    super.key,
    super.fit = ChoiceModalFit.fill,
  });

  @override
  Widget? bottomBuilder(BuildContext context, AppTheme appTheme) {
    return null;
  }

  @override
  Widget contentBuilder(BuildContext context, AppTheme appTheme) {
    return Column(
      children: [
        _PostRemixItemWidget(
          appTheme: appTheme,
          title: localization.translate(
            LanguageKey.discoverPostScreenUseAsInputImage,
          ),
          iconPath: AssetIconPath.icCommonImage,
          onTap: onUseInputImage,
        ),

        _PostRemixItemWidget(
          appTheme: appTheme,
          title: localization.translate(
            LanguageKey.discoverPostScreenCreateArtWithPrompt,
          ),
          iconPath: AssetIconPath.icCommonEditImage,
          onTap: onCreateArtWithPrompt,
        ),
        _PostRemixItemWidget(
          appTheme: appTheme,
          title: localization.translate(
            LanguageKey.discoverPostScreenTryStyle,
          ),
          iconPath: AssetIconPath.icCommonEdit,
          onTap: onCreateArtWithPrompt,
        ),
      ],
    );
  }

  @override
  Widget? titleBuilder(BuildContext context, AppTheme appTheme) {
    return Center(
      child: Text(
        localization.translate(
          LanguageKey.discoverPostScreenRemix,
        ),
        style: AppTypography.heading4Bold.copyWith(
          color: appTheme.greyScaleColor900,
        ),
      ),
    );
  }
}
