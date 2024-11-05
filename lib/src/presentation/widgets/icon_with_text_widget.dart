import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class DualWidgetRow extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final double spacing;
  final AppTheme appTheme;
  final VoidCallback? onFirstChildTap;
  final VoidCallback? onSecondChildTap;

  const DualWidgetRow({
    this.spacing = BoxSize.boxSize03,
    required this.appTheme,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.onFirstChildTap,
    this.onSecondChildTap,
    super.key,
  });

  Widget firstChild(BuildContext context);

  Widget secondChild(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        GestureDetector(
          onTap: onFirstChildTap,
          behavior: HitTestBehavior.opaque,
          child: firstChild(
            context,
          ),
        ),
        buildSpacing(),
        GestureDetector(
          onTap: onSecondChildTap,
          behavior: HitTestBehavior.opaque,
          child: secondChild(
            context,
          ),
        ),
      ],
    );
  }

  @protected
  Widget buildSpacing() {
    if (mainAxisAlignment == MainAxisAlignment.spaceBetween ||
        mainAxisAlignment == MainAxisAlignment.spaceAround) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      width: spacing,
    );
  }
}

final class IconWithTextWidget extends DualWidgetRow {
  final String icSvgPath;
  final TextStyle? style;
  final String title;

  const IconWithTextWidget({
    required this.title,
    required this.icSvgPath,
    this.style,
    super.onFirstChildTap,
    super.onSecondChildTap,
    required super.appTheme,
    super.mainAxisAlignment,
    super.key,
    super.spacing,
  });

  @override
  Widget firstChild(BuildContext context) {
    return SvgPicture.asset(
      icSvgPath,
    );
  }

  @override
  Widget secondChild(BuildContext context) {
    return Text(
      title,
      style: style ??
          AppTypography.heading4Bold.copyWith(
            color: appTheme.greyScaleColor900,
          ),
    );
  }
}

final class TextWithIconWidget extends DualWidgetRow {
  final String icSvgPath;
  final TextStyle? style;
  final String title;

  const TextWithIconWidget({
    required this.title,
    required this.icSvgPath,
    this.style,
    super.onFirstChildTap,
    super.onSecondChildTap,
    required super.appTheme,
    super.mainAxisAlignment,
    super.key,
    super.spacing,
  });

  @override
  Widget firstChild(BuildContext context) {
    return Text(
      title,
      style: style ??
          AppTypography.heading4Bold.copyWith(
            color: appTheme.greyScaleColor900,
          ),
    );
  }

  @override
  Widget secondChild(BuildContext context) {
    return SvgPicture.asset(
      icSvgPath,
    );
  }
}

final class FlexibleDualWidgetRow extends DualWidgetRow {
  final Widget firstChildWidget;
  final Widget secondChildWidget;

  const FlexibleDualWidgetRow({
    required this.firstChildWidget,
    required this.secondChildWidget,
    required super.appTheme,
    super.key,
    super.mainAxisAlignment,
    super.spacing,
    super.onFirstChildTap,
    super.onSecondChildTap,
  });

  @override
  Widget firstChild(BuildContext context) {
    return firstChildWidget;
  }

  @override
  Widget secondChild(BuildContext context) {
    return secondChildWidget;
  }
}

final class ExpandedDualWidgetRow extends DualWidgetRow {
  final Widget firstChildWidget;
  final Widget secondChildWidget;
  final int firstFlex;
  final int secondFlex;

  const ExpandedDualWidgetRow({
    required this.firstChildWidget,
    required this.secondChildWidget,
    this.firstFlex = 1,
    this.secondFlex = 1,
    required super.appTheme,
    super.key,
    super.mainAxisAlignment,
    super.spacing,
    super.onFirstChildTap,
    super.onSecondChildTap,
  });

  @override
  Widget firstChild(BuildContext context) {
    return firstChildWidget;
  }

  @override
  Widget secondChild(BuildContext context) {
    return secondChildWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Expanded(
          flex: firstFlex,
          child: GestureDetector(
            onTap: onFirstChildTap,
            behavior: HitTestBehavior.opaque,
            child: firstChild(
              context,
            ),
          ),
        ),
        buildSpacing(),
        Expanded(
          flex: secondFlex,
          child: GestureDetector(
            onTap: onSecondChildTap,
            behavior: HitTestBehavior.opaque,
            child: secondChild(
              context,
            ),
          ),
        ),
      ],
    );
  }
}

final class CustomDualWidgetRow extends DualWidgetRow {
  final Widget firstChildWidget;
  final Widget secondChildWidget;

  const CustomDualWidgetRow({
    required this.firstChildWidget,
    required this.secondChildWidget,
    required super.appTheme,
    super.key,
    super.mainAxisAlignment,
    super.spacing,
    super.onFirstChildTap,
    super.onSecondChildTap,
  });

  @override
  Widget firstChild(BuildContext context) {
    return firstChildWidget;
  }

  @override
  Widget secondChild(BuildContext context) {
    return secondChildWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        firstChild(
          context,
        ),
        buildSpacing(),
        secondChild(
          context,
        ),
      ],
    );
  }
}
