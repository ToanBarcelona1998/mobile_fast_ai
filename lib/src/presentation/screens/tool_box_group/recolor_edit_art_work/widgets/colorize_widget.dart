import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class RecolorColorizeWidget extends StatelessWidget {
  final int selectedIndex;
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final void Function(int) onSelected;

  const RecolorColorizeWidget({
    required this.appTheme,
    required this.localization,
    required this.selectedIndex,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWithIconWidget(
          title: localization.translate(
            LanguageKey.recolorImageEditArtWorkScreenColorize,
          ),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          icSvgPath: AssetIconPath.icCommonArrowRightActive,
          appTheme: appTheme,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          primary: false,
          itemCount: 12,
          // replace with your data
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: Spacing.spacing04,
            mainAxisSpacing: Spacing.spacing05,
          ),
          itemBuilder: (context, index) {
            return _ColorizeWidget(
              colorize: 'Hefe',
              url: randomDummyImg(),
              appTheme: appTheme,
              isSelected: selectedIndex == index,
              onTap: () => onSelected(index),
            );
          },
        ),
      ],
    );
  }
}

class _ColorizeWidget extends StatelessWidget {
  final String colorize;
  final String url;
  final AppTheme appTheme;
  final bool isSelected;
  final VoidCallback onTap;

  const _ColorizeWidget({
    required this.colorize,
    required this.url,
    required this.appTheme,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
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
              alignment: Alignment.center,
              child: NetworkImageWidget(
                imageUrl: url,
                appTheme: appTheme,
              ),
            ),
          ),
          const SizedBox(
            height: BoxSize.boxSize02,
          ),
          Text(
            colorize,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.bodyLargeSemiBold.copyWith(
              color: isSelected
                  ? appTheme.primaryColor900
                  : appTheme.greyScaleColor900,
            ),
          ),
        ],
      ),
    );
  }
}
