import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/dart_core_extension.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bottom_sheet_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'choice_modal_widget.dart';

class ChoiceSelectWidget<T> extends StatefulWidget {
  final List<T> data;
  final List<T>? selectedData;
  final String? label;
  final String? hint;
  final bool isRequired;
  final Widget Function(List<T>) builder;
  final Widget Function(T) optionBuilder;
  final String modalTitle;
  final ChoiceModalSize modalSize;
  final VoidCallback? onCloseModal;
  final void Function(List<T>)? onChange;
  final bool Function(List<T>, T) isSelected;
  final Widget? suffix;

  const ChoiceSelectWidget({
    required this.data,
    this.selectedData,
    this.label,
    this.hint,
    this.isRequired = false,
    super.key,
    required this.builder,
    required this.optionBuilder,
    required this.modalTitle,
    this.modalSize = ChoiceModalSize.small,
    this.onCloseModal,
    this.onChange,
    this.suffix,
    required this.isSelected,
  });

  @override
  State<ChoiceSelectWidget<T>> createState() => _ChoiceSelectWidgetState<T>();
}

class _ChoiceSelectWidgetState<T> extends State<ChoiceSelectWidget<T>> {
  final List<T> _selectedOption = List.empty(growable: true);

  bool _isFocus = false;

  Color _borderColorBuilder(AppTheme theme) {
    Color color = theme.greyScaleColor500;
    if (_isFocus) {
      color = theme.primaryColor900;
    }

    return color;
  }

  @override
  void initState() {
    super.initState();
    _selectedOption.addAll(widget.selectedData ?? []);
  }

  @override
  void didUpdateWidget(covariant ChoiceSelectWidget<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedData != oldWidget.selectedData) {
      _selectedOption.addAll(widget.selectedData ?? []);
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
              onTap: () {
                _showChoiceOption(appTheme);
              },
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
                      child: _selectedOption.isEmpty && widget.hint.isNotNullOrEmpty
                          ? Text(
                              widget.hint!,
                              style: AppTypography.bodyLargeMedium.copyWith(
                                color: appTheme.greyScaleColor400,
                              ),
                            )
                          : widget.builder(_selectedOption),
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

  void _showChoiceOption(AppTheme theme) async {
    _isFocus = true;
    setState(() {});

    final List<T>? selectData = await AppBottomSheetProvider.showNormalBottomSheet<List<T>>(
      context,
      theme: theme,
      child: ChoiceModalWidget<T>(
        data: widget.data,
        title: widget.modalTitle,
        builder: widget.optionBuilder,
        onClose: widget.onCloseModal,
        selectedData: _selectedOption,
        appTheme: theme,
        isSelected: widget.isSelected,
      ),
    );
    _isFocus = false;
    setState(() {});

    if (selectData == null) return;

    setState(() {});

    _selectedOption.clear();

    _selectedOption.addAll(
      selectData,
    );

    widget.onChange?.call(_selectedOption);
  }
}
