import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/material.dart';

class TextBoxWidget extends StatelessWidget {
  final String text;
  final AppTheme appTheme;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  const TextBoxWidget({
    required this.text,
    this.textStyle,
    required this.appTheme,
    this.textAlign,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Spacing.spacing05,
        horizontal: Spacing.spacing04,
      ),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          BorderRadiusSize.borderRadius03,
        ),
        color: appTheme.greyScaleColor200,
        border: Border.all(
          color: appTheme.greyScaleColor50,
        ),
      ),
      child: Text(
        text,
        style: textStyle ??
            AppTypography.heading4Bold.copyWith(
              color: appTheme.greyScaleColor900,
            ),
        textAlign: textAlign ?? TextAlign.center,
      ),
    );
  }
}

class TextBoxWithLabel extends StatelessWidget {
  final String? label;
  final Widget? labelWidget;
  final String text;
  final AppTheme appTheme;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;

  const TextBoxWithLabel({
    this.label,
    this.labelWidget,
    this.textStyle,
    this.labelStyle,
    required this.appTheme,
    required this.text,
    super.key,
  }) : assert(label != null || labelWidget != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelWidget ??
            Text(
              label!,
              style: labelStyle ??
                  AppTypography.heading5Bold.copyWith(
                    color: appTheme.greyScaleColor900,
                  ),
            ),
        const SizedBox(
          height: BoxSize.boxSize03,
        ),
        TextBoxWidget(
          text: text,
          appTheme: appTheme,
          textStyle: textStyle ??
              AppTypography.bodyLargeSemiBold.copyWith(
                color: appTheme.greyScaleColor900,
              ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
