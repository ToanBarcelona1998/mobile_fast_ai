import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:mobile_fast_ai/src/cores/utils/color_extension.dart';

class TextEffectEditArtWorkBoxColorWidget extends StatelessWidget {
  final String? hex;
  final String? imgUrl;
  final bool isSelected;
  final AppTheme appTheme;
  final VoidCallback onTap;

  const TextEffectEditArtWorkBoxColorWidget({
    this.hex,
    this.imgUrl,
    required this.appTheme,
    required this.onTap,
    this.isSelected = false,
    super.key,
  }) : assert(hex != null || imgUrl != null);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          image: imgUrl != null
              ? DecorationImage(
                  image: NetworkImage(
                    imgUrl!,
                  ),
                  fit: BoxFit.cover,
                )
              : null,
          borderRadius: BorderRadius.circular(
            BorderRadiusSize.borderRadius03,
          ),
          color: HexColor.fromHex(hex),
          border: isSelected
              ? Border.all(
                  color: appTheme.primaryColor900,
                )
              : null,
        ),
      ),
    );
  }
}
