import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'box_color_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:flutter/material.dart';

class TextEffectEditArtWorkBackgroundColorWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final int indexSelected;
  final void Function(int) onSelected;

  const TextEffectEditArtWorkBackgroundColorWidget({
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
            LanguageKey.textEffectEditArtWorkScreenBackGroundColor,
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
          itemCount: dummyBgColor.length,
          // replace with your data
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: Spacing.spacing04,
            mainAxisSpacing: Spacing.spacing05,
          ),
          itemBuilder: (context, index) {
            final String hex = dummyBgColor[index];
            return TextEffectEditArtWorkBoxColorWidget(
              appTheme: appTheme,
              hex: hex,
              isSelected: indexSelected == index,
              onTap: () => onSelected(index),
            );
          },
        ),
      ],
    );
  }
}
