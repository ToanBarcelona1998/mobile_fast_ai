import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/switch_widget.dart';
import 'package:flutter/material.dart';

class SecurityWidget extends StatelessWidget {
  final AppTheme appTheme;
  final String text;
  final bool value;
  final void Function(bool) onChanged;

  const SecurityWidget({
    required this.appTheme,
    required this.text,
    required this.onChanged,
    this.value = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: Spacing.spacing05,
      ),
      child: CustomDualWidgetRow(
        firstChildWidget: Expanded(
          child: Text(
            text,
            style: AppTypography.heading6Bold.copyWith(
              color: appTheme.greyScaleColor900,
            ),
          ),
        ),
        secondChildWidget: SwitchWidget(
          onChanged: onChanged,
          isSelected: value,
          appTheme: appTheme,
        ),
        appTheme: appTheme,
      ),
    );
  }
}
