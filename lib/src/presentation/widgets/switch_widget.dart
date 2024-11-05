import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:flutter/cupertino.dart';

class SwitchWidget extends StatelessWidget {
  final bool isSelected;
  final void Function(bool) onChanged;
  final AppTheme appTheme;

  const SwitchWidget({
    super.key,
    required this.onChanged,
    required this.isSelected,
    required this.appTheme,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: isSelected,
      onChanged: onChanged,
      activeColor: appTheme.primaryColor900,
      trackColor: appTheme.greyScaleColor200,
      thumbColor: appTheme.otherColorWhite,
      offLabelColor: appTheme.greyScaleColor200,
    );
  }
}
