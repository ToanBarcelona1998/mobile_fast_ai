import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/box_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditArtWorkOptionWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final VoidCallback? onUndoBack;
  final VoidCallback? onUndoNext;
  final VoidCallback? onPrint;
  final VoidCallback? onChangeView;
  final int selected;

  const EditArtWorkOptionWidget({
    required this.appTheme,
    required this.localization,
    this.onChangeView,
    this.onPrint,
    this.onUndoNext,
    this.onUndoBack,
    this.selected = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: onPrint,
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: const EdgeInsets.all(
                  Spacing.spacing04,
                ),
                decoration: BoxDecoration(
                  border: borderOption,
                  color: selected == 0
                      ? appTheme.primaryColor900
                      : appTheme.bodyBackGroundColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(
                      BorderRadiusSize.borderRadius03,
                    ),
                    topLeft: Radius.circular(
                      BorderRadiusSize.borderRadius03,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  selected == 0
                      ? AssetIconPath.icEditArtWorkPrint
                      : AssetIconPath.icEditArtWorkPrintActive,
                ),
              ),
            ),
            GestureDetector(
              onTap: onChangeView,
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: const EdgeInsets.all(
                  Spacing.spacing04,
                ),
                decoration: BoxDecoration(
                  border: borderOption,
                  color: selected == 1
                      ? appTheme.primaryColor900
                      : appTheme.bodyBackGroundColor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(
                      BorderRadiusSize.borderRadius03,
                    ),
                    topRight: Radius.circular(
                      BorderRadiusSize.borderRadius03,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  selected == 1
                      ? AssetIconPath.icEditArtWorkCategory
                      : AssetIconPath.icEditArtWorkCategoryActive,
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: onUndoBack,
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: const EdgeInsets.all(
                  Spacing.spacing04,
                ),
                decoration: BoxDecoration(
                  border: borderOption,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(
                      BorderRadiusSize.borderRadius03,
                    ),
                    topLeft: Radius.circular(
                      BorderRadiusSize.borderRadius03,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Text(
                      localization.translate(
                        LanguageKey.animeEditArtWorkScreenUndo,
                      ),
                      style: undoTextStyle,
                    ),
                    const SizedBox(
                      width: BoxSize.boxSize03,
                    ),
                    SvgPicture.asset(
                      AssetIconPath.icEditArtWorkUndoBack,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: onUndoNext,
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: const EdgeInsets.all(
                  Spacing.spacing04,
                ),
                decoration: BoxDecoration(
                  border: borderOption,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(
                      BorderRadiusSize.borderRadius03,
                    ),
                    topRight: Radius.circular(
                      BorderRadiusSize.borderRadius03,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Text(
                      localization.translate(
                        LanguageKey.animeEditArtWorkScreenUndo,
                      ),
                      style: undoTextStyle,
                    ),
                    const SizedBox(
                      width: BoxSize.boxSize03,
                    ),
                    SvgPicture.asset(
                      AssetIconPath.icEditArtWorkUndoNext,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  BorderSide get borderSide => BorderSide(
        color: appTheme.primaryColor900,
        width: BorderSize.border01,
      );

  Border get borderOption => Border(
        right: borderSide,
        top: borderSide,
        bottom: borderSide,
        left: borderSide.copyWith(
          width: BorderSize.borderPart,
        ),
      );

  TextStyle get undoTextStyle => AppTypography.bodyMediumSemiBold.copyWith(
        color: appTheme.primaryColor900,
      );
}
