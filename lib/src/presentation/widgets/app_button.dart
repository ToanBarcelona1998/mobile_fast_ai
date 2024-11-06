import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:flutter/material.dart';

class _AppButton extends StatelessWidget {
  final String text;
  final Widget? leading;
  final Widget? suffix;
  final TextStyle textStyle;

  final Color? color;
  final Color? disableColor;
  final Gradient? gradient;

  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final double? minWidth;

  final bool disabled;
  final bool loading;

  final void Function()? onPress;

  final AppTheme theme;

  final Color? borderColor;

  _AppButton({
    Key? key,
    required this.text,
    this.onPress,
    this.color,
    this.borderColor,
    this.disableColor,
    this.gradient,
    this.minWidth,
    this.leading,
    this.suffix,
    bool? loading,
    bool? disabled,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    required this.theme,
    required this.textStyle,
  })  : assert(color == null || gradient == null),
        loading = loading ?? false,
        disabled = (disabled ?? false) || (loading ?? false),
        padding = padding ?? const EdgeInsets.all(18),
        borderRadius = borderRadius ?? BorderRadius.circular(100),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: theme.otherColorWhite,
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAlias,
      child: Ink(
        decoration: BoxDecoration(
          color: disabled ? disableColor : color,
          gradient: disabled ? null : gradient,
          borderRadius: borderRadius,
          border: borderColor != null
              ? Border.all(
                  color: borderColor!,
                )
              : null,
        ),
        child: InkWell(
          splashColor: theme.primaryColor50,
          highlightColor: theme.primaryColor50,
          onTap: disabled ? null : onPress,
          child: Container(
            constraints:
                minWidth != null ? BoxConstraints(minWidth: minWidth!) : null,
            padding: padding,
            alignment: Alignment.center,
            child: loading
                ? SizedBox.square(
                    dimension: 19.2,
                    child: CircularProgressIndicator(color: textStyle.color),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      leading ?? const SizedBox.shrink(),
                      if (leading != null)
                        const SizedBox(
                          width: 7,
                        ),
                      Text(
                        text,
                        style: textStyle,
                      ),
                      if (suffix != null)
                        const SizedBox(
                          width: 7,
                        ),
                      suffix ?? const SizedBox.shrink(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

final class PrimaryAppButton extends StatelessWidget {
  final String text;
  final Widget? leading;
  final Widget? suffix;
  final bool? isDisable;
  final VoidCallback? onPress;
  final double? minWidth;
  final Color? backGroundColor;
  final TextStyle? textStyle;

  const PrimaryAppButton({
    super.key,
    required this.text,
    this.isDisable,
    this.leading,
    this.suffix,
    this.onPress,
    this.minWidth,
    this.backGroundColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (theme) {
        return _AppButton(
          text: text,
          disabled: isDisable,
          onPress: onPress,
          color: backGroundColor ?? theme.primaryColor900,
          disableColor: theme.primaryColor50,
          minWidth: minWidth,
          textStyle: textStyle ??
              AppTypography.bodyXLargeSemiBold.copyWith(
                color: theme.otherColorWhite,
              ),
          theme: theme,
          leading: leading,
          suffix: suffix,
        );
      },
    );
  }
}

final class BorderAppButton extends StatelessWidget {
  final String text;
  final bool? isDisable;
  final VoidCallback? onPress;
  final double? minWidth;
  final Color? borderColor;
  final Color? textColor;
  final Widget? leading;
  final Widget? suffix;

  const BorderAppButton({
    super.key,
    required this.text,
    this.isDisable,
    this.onPress,
    this.minWidth,
    this.borderColor,
    this.textColor,
    this.leading,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (theme) {
        return _AppButton(
          text: text,
          disabled: isDisable,
          onPress: onPress,
          minWidth: minWidth,
          textStyle: AppTypography.bodyXLargeSemiBold.copyWith(
            color: theme.greyScaleColor900,
          ),
          theme: theme,
          borderColor: borderColor ?? theme.greyScaleColor200,
          suffix: suffix,
          leading: leading,
        );
      },
    );
  }
}