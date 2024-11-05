import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/simple_network_image_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArtStyleWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;

  const ArtStyleWidget({
    required this.localization,
    required this.appTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FlexibleDualWidgetRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          firstChildWidget: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: localization.translate(
                    LanguageKey.homePageArtStyle,
                  ),
                  style: AppTypography.heading4Bold.copyWith(
                    color: appTheme.greyScaleColor900,
                  ),
                ),
                TextSpan(
                  text: ' (${localization.translate(
                    LanguageKey.homePageOptional,
                  )})',
                  style: AppTypography.bodyXLargeRegular.copyWith(
                    color: appTheme.greyScaleColor700,
                  ),
                ),
              ],
            ),
          ),
          secondChildWidget: SvgPicture.asset(
            AssetIconPath.icCommonArrowRightActive,
          ),
          onSecondChildTap: () {
            AppNavigator.push(
              RoutePath.artStyle,
            );
          },
          appTheme: appTheme,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              4,
              (index) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: index == 3
                        ? Spacing.spacing0
                        : Spacing
                            .spacing04, // clean padding when is the last item
                  ),
                  child: SimpleNetworkImageInfoWidget(
                    imgTitle: randomDummyImgTitle(),
                    imgUrl: randomDummyImg(),
                    appTheme: appTheme,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
