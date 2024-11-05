import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/dart_core_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LabelInputWidget extends StatefulWidget {
  final String? value;
  final String? label;
  final String hint;
  final bool isRequired;
  final Widget? suffix;
  final Future<String?> Function() onTap;
  final void Function(String?) onChanged;

  const LabelInputWidget({
    this.value,
    this.label,
    required this.hint,
    this.isRequired = false,
    super.key,
    this.suffix,
    required this.onTap,
    required this.onChanged,
  });

  @override
  State<LabelInputWidget> createState() => _LabelInputWidgetState();
}

class _LabelInputWidgetState<T> extends State<LabelInputWidget> {
  late String? value;

  bool _isFocus = false;

  Color _borderColorBuilder(AppTheme theme) {
    Color color = theme.greyScaleColor500;
    if (_isFocus) {
      color = theme.primaryColor900;
    }

    return color;
  }

  void _onTap() async {
    _isFocus = true;
    setState(() {});

    final String ? receiveValue = await widget.onTap();

    _isFocus = false;
    setState(() {});

    if(receiveValue == null){
      return;
    }

    value = receiveValue;

    widget.onChanged(value);
    setState(() {});
  }

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant LabelInputWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      value = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (appTheme) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.label != null
                ? Column(
                    children: [
                      buildLabel(appTheme)!,
                      const SizedBox(
                        height: BoxSize.boxSize03,
                      ),
                    ],
                  )
                : const SizedBox(),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _onTap,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.spacing0,
                  vertical: Spacing.spacing02,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: _borderColorBuilder(appTheme),
                      width: BorderSize.border01,
                    ),
                  ),
                ),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Expanded(
                      child: value.isEmptyOrNull
                          ? Text(
                              widget.hint,
                              style: AppTypography.bodyLargeRegular.copyWith(
                                color: appTheme.greyScaleColor700,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          : Text(
                              value ?? '',
                              style: AppTypography.bodyLargeMedium.copyWith(
                                color: appTheme.greyScaleColor900,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                    ),
                    const SizedBox(
                      width: BoxSize.boxSize05,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(Spacing.spacing02),
                      child: widget.suffix ??
                          SvgPicture.asset(
                            AssetIconPath.icCommonArrowDown,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget? buildLabel(AppTheme theme) {
    if (widget.label.isEmptyOrNull) {
      return null;
    }

    if (widget.isRequired) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: widget.label,
              style: AppTypography.bodyLargeSemiBold.copyWith(
                color: theme.greyScaleColor900,
              ),
            ),
            TextSpan(
              text: ' *',
              style: AppTypography.bodyLargeSemiBold.copyWith(
                color: theme.otherColorRed,
              ),
            ),
          ],
        ),
      );
    }

    return Text(
      widget.label!,
      style: AppTypography.bodyLargeSemiBold.copyWith(
        color: theme.greyScaleColor900,
      ),
    );
  }
}
