import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:flutter/material.dart';

class TextEffectEditArtWorkFontWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final int indexSelected;
  final void Function(int) onSelected;

  const TextEffectEditArtWorkFontWidget({
    required this.appTheme,
    required this.localization,
    required this.onSelected,
    this.indexSelected = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWithIconWidget(
          title: localization.translate(
            LanguageKey.textEffectEditArtWorkScreenFont,
          ),
          appTheme: appTheme,
          icSvgPath: AssetIconPath.icCommonArrowRightActive,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          onSecondChildTap: () {},
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          primary: false,
          itemCount: 6,
          // replace with your data
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: Spacing.spacing04,
            mainAxisSpacing: Spacing.spacing05,
          ),
          itemBuilder: (context, index) {
            return _FontWidget(
              label: 'Ag',
              fontName: 'Poppins',
              appTheme: appTheme,
              isSelected: indexSelected == index,
              onTap: () => onSelected(index),
            );
          },
        ),
      ],
    );
  }
}

class _FontWidget extends StatelessWidget {
  final String label;
  final String fontName;
  final AppTheme appTheme;
  final bool isSelected;
  final VoidCallback onTap;

  const _FontWidget({
    required this.label,
    required this.fontName,
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
                color: appTheme.greyScaleColor100,
                border: isSelected
                    ? Border.all(
                        color: appTheme.primaryColor900,
                        width: BorderSize.border02,
                      )
                    : null,
              ),
              alignment: Alignment.center,
              child: Text(
                label,
                style: AppTypography.heading1Bold.copyWith(
                  fontFamily: fontName,
                  color: appTheme.greyScaleColor900,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const SizedBox(
            height: BoxSize.boxSize02,
          ),
          Text(
            fontName,
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
