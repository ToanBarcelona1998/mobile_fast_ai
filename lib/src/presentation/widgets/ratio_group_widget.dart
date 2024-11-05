import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/ratio_widget.dart';
import 'package:flutter/material.dart';

class RatioGroupWidget extends StatelessWidget {
  final AppTheme appTheme;
  final int selectedValue;
  final void Function(int) onChanged;

  const RatioGroupWidget({
    required this.appTheme,
    required this.selectedValue,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RatioWidget<int>(
            appTheme: appTheme,
            ratio: '1:1',
            ratioImgPath: AssetIconPath.icCommonRectangle11,
            selectedRatioPath: AssetIconPath.icCommonRectangleWhite11,
            value: 1,
            selectedValue: selectedValue,
            onSelected: onChanged,
          ),
          const SizedBox(
            width: BoxSize.boxSize04,
          ),
          RatioWidget(
            appTheme: appTheme,
            ratio: '9:16',
            ratioImgPath: AssetIconPath.icCommonRectangle916,
            selectedRatioPath: AssetIconPath.icCommonRectangleWhite916,
            value: 2,
            selectedValue: selectedValue,
            onSelected: onChanged,
          ),
          const SizedBox(
            width: BoxSize.boxSize04,
          ),
          RatioWidget(
            appTheme: appTheme,
            ratio: '16:9',
            ratioImgPath: AssetIconPath.icCommonRectangle169,
            selectedRatioPath: AssetIconPath.icCommonRectangleWhite169,
            value: 3,
            selectedValue: selectedValue,
            onSelected: onChanged,
          ),
          const SizedBox(
            width: BoxSize.boxSize04,
          ),
          RatioWidget(
            appTheme: appTheme,
            ratio: '3:4',
            ratioImgPath: AssetIconPath.icCommonRectangle34,
            selectedRatioPath: AssetIconPath.icCommonRectangleWhite34,
            value: 4,
            selectedValue: selectedValue,
            onSelected: onChanged,
          ),
        ],
      ),
    );
  }
}
