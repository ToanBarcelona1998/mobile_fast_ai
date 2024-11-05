import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/utils/dart_core_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckBoxWidget extends StatelessWidget {
  final String? label;
  final Widget? labelWidget;
  final bool? value;
  final AppTheme appTheme;
  final void Function(bool?) onChanged;

  const CheckBoxWidget({
    this.label,
    this.labelWidget,
    this.value,
    required this.appTheme,
    required this.onChanged,
    super.key,
  });

  String get _checkBoxPath => value == true ? AssetIconPath.icCommonCheckboxUncheck : AssetIconPath.icCommonCheckboxChecked;

  @override
  Widget build(BuildContext context) {
    if (label.isEmptyOrNull && labelWidget == null) {
      return SvgPicture.asset(
        _checkBoxPath,
      );
    } else {
      return Row(
        children: [
          SvgPicture.asset(
            _checkBoxPath,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: labelWidget ?? Text(
              label!,
              style: AppTypography.bodyLargeSemiBold.copyWith(
                color: appTheme.greyScaleColor900,
              ),
            ),
          ),
        ],
      );
    }
  }
}
