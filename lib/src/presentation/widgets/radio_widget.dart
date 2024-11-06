import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RadioWidget<T> extends StatelessWidget {
  final String label;
  final T value;
  final T group;
  final AppTheme appTheme;
  final void Function(T) ?onChanged;

  const RadioWidget({
    required this.label,
    required this.value,
    required this.group,
    required this.appTheme,
    this.onChanged,
    super.key,
  });

  bool get isSelected => value == group;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        if(!isSelected){
          onChanged?.call(value);
        }
      },
      child: CustomDualWidgetRow(
        firstChildWidget: SvgPicture.asset(
          isSelected
              ? AssetIconPath.icCommonRadioCheck
              : AssetIconPath.icCommonRadio,
        ),
        secondChildWidget: Expanded(
          child: Text(
            label,
            style: AppTypography.bodyLargeSemiBold.copyWith(
              color: appTheme.greyScaleColor900,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        appTheme: appTheme,
      ),
    );
  }
}
