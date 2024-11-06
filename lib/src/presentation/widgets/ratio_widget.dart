import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RatioWidget<T> extends StatelessWidget {
  final AppTheme appTheme;
  final String ratio;
  final String ratioImgPath;
  final String selectedRatioPath;
  final T value;
  final T selectedValue;
  final void Function(T) onSelected;

  const RatioWidget({
    required this.appTheme,
    required this.ratio,
    required this.ratioImgPath,
    required this.selectedRatioPath,
    required this.value,
    required this.selectedValue,
    required this.onSelected,
    super.key,
  });

  bool get isSelected => value == selectedValue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onSelected(value);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: Spacing.spacing03,
          horizontal: Spacing.spacing06,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            BorderRadiusSize.borderRadiusRound,
          ),
          border: isSelected ? null : Border.all(
            color: appTheme.primaryColor900,
            width: BorderSize.border02,
          ),
          color: isSelected ? appTheme.primaryColor900 : null
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              isSelected ? selectedRatioPath : ratioImgPath,
            ),
            const SizedBox(
              width: BoxSize.boxSize04,
            ),
            Text(
              ratio,
              style: AppTypography.bodyLargeSemiBold.copyWith(
                color: isSelected ? appTheme.otherColorWhite : appTheme.primaryColor900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
