import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/dart_core_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'text_input_manager.dart';

///region text input base
abstract class TextInputWidgetBase extends StatefulWidget {
  final TextEditingController? controller;
  final ConstraintManager? constraintManager;
  final String? hintText;
  final VoidCallback? onClear;
  final void Function(String, bool)? onChanged;
  final void Function(String, bool)? onSubmit;
  final int? maxLine;
  final int? minLine;
  final int? maxLength;
  final bool enable;
  final bool obscureText;
  final bool autoFocus;
  final FocusNode? focusNode;
  final EdgeInsets scrollPadding;
  final ScrollController? scrollController;
  final ScrollPhysics? physics;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? keyBoardType;
  final BoxConstraints? boxConstraints;
  final bool enableClear;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final TextAlign textAlign;
  final bool enableInputConstraint;

  const TextInputWidgetBase({
    super.key,
    this.textAlign = TextAlign.start,
    this.hintStyle,
    this.textStyle,
    this.labelStyle,
    this.constraintManager,
    this.enableClear = false,
    this.enableInputConstraint = true,
    this.onClear,
    this.controller,
    this.hintText,
    this.onChanged,
    this.onSubmit,
    this.maxLength,
    this.minLine,
    this.maxLine = 1,
    this.enable = true,
    this.autoFocus = false,
    this.obscureText = false,
    this.focusNode,
    this.scrollPadding = const EdgeInsets.symmetric(),
    this.scrollController,
    this.physics,
    this.inputFormatter,
    this.keyBoardType,
    this.boxConstraints,
  });

  @override
  State<StatefulWidget> createState() {
    return TextInputWidgetBaseState<TextInputWidgetBase>();
  }
}

class TextInputWidgetBaseState<T extends TextInputWidgetBase> extends State<T> {
  late TextEditingController _controller;

  String? errorMessage;

  late FocusNode _focusNode;

  bool enableClear = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Widget? buildLabel(AppTheme theme) {
    return null;
  }

  ///region build input form builder
  Widget inputFormBuilder(
    BuildContext context,
    Widget child,
    AppTheme theme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildLabel(theme) != null
            ? Column(
                children: [
                  buildLabel(theme)!,
                  const SizedBox(
                    height: BoxSize.boxSize02,
                  ),
                ],
              )
            : const SizedBox(),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.spacingNone,
            vertical: Spacing.spacing02,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: _borderColorBuilder(theme),
                width: BorderSize.border01,
              ),
            ),
          ),
          alignment: Alignment.center,
          child: child,
        ),
        errorMessage.isNotNullOrEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: BoxSize.boxSize03,
                  ),
                  Text(
                    errorMessage!,
                    style: AppTypography.bodyMediumMedium.copyWith(
                      color: theme.otherColorRed,
                    ),
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }

  ///endregion

  ///region build text input base
  Widget buildTextInput(AppTheme theme) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            style: widget.textStyle ??
                AppTypography.bodyLargeMedium.copyWith(
                  color: theme.greyScaleColor900,
                ),
            textAlign: widget.textAlign,
            enabled: widget.enable,
            autofocus: widget.autoFocus,
            maxLines: widget.maxLine,
            maxLength: widget.maxLength,
            minLines: widget.minLine,
            obscureText: widget.obscureText,
            onSubmitted: (value) {
              if (widget.onSubmit != null) {
                widget.onSubmit!(value, errorMessage.isEmptyOrNull);
              }
            },
            focusNode: _focusNode,
            showCursor: true,
            scrollPadding: widget.scrollPadding,
            scrollController: widget.scrollController,
            scrollPhysics: widget.physics,
            inputFormatters: widget.inputFormatter,
            keyboardType: widget.keyBoardType,
            onChanged: (value) {
              if (widget.constraintManager != null) {
                if (widget.constraintManager!.isValidOnChanged) {
                  validate();
                }
              }

              widget.onChanged?.call(value, errorMessage.isEmptyOrNull);
            },
            decoration: InputDecoration(
              hintText: widget.hintText,
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              hintStyle: widget.hintStyle ??
                  AppTypography.bodyLargeMedium.copyWith(
                    color: theme.greyScaleColor400,
                  ),
              constraints: widget.enableInputConstraint ? widget.boxConstraints : null,

              /// This line may be fix in the future.
              counterText: '',
            ),
          ),
        ),
        if (enableClear && widget.enableClear) ...[
          const SizedBox(
            width: BoxSize.boxSize04,
          ),
          GestureDetector(
            onTap: widget.onClear,
            behavior: HitTestBehavior.opaque,
            child: SvgPicture.asset(
              AssetIconPath.icCommonClose,
            ),
          ),
        ]
      ],
    );
  }

  ///endregion

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (theme) {
        return inputFormBuilder(
          context,
          buildTextInput(theme),
          theme,
        );
      },
    );
  }

  String value() => _controller.text;

  void setValue(String value) {
    _controller.text = value;

    validate();

    widget.onChanged?.call(value, errorMessage.isEmptyOrNull);
  }

  late bool isFocus;

  Color _borderColorBuilder(AppTheme theme) {
    Color color = theme.greyScaleColor500;
    if (isFocus) {
      color = theme.primaryColor900;
    }

    if (errorMessage.isEmptyOrNull) {
      if (isFocus) return color;

      color = theme.greyScaleColor500;
    } else {
      color = theme.otherColorRed;
    }

    return color;
  }

  void _addFocusListener() {
    if (_focusNode.hasFocus) {
      isFocus = true;
    } else {
      isFocus = false;
    }

    if (mounted) {
      setState(() {});
    }
  }

  void _onTextInputChange() {
    if (!widget.enableClear) return;
    if (_controller.text.trim().isEmpty) {
      enableClear = false;
    } else {
      enableClear = true;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();

    _controller.addListener(_onTextInputChange);

    _focusNode = widget.focusNode ?? FocusNode(canRequestFocus: true);

    isFocus = widget.autoFocus;

    _focusNode.addListener(_addFocusListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextInputChange);
    if (widget.controller == null) {
      _controller.dispose();
    }
    _focusNode.removeListener(_addFocusListener);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != null &&
        oldWidget.controller?.text != _controller.text) {
      _controller = widget.controller!;
    }
  }

  bool validate() {
    ConstraintManager? constraintManager = widget.constraintManager;
    errorMessage = null;
    if (constraintManager != null) {
      final CheckResult result = constraintManager.checkAll(
        _controller.text,
      );
      if (!result.isSuccess) {
        errorMessage = result.message;
      } else {
        errorMessage = null;
      }
      setState(() {});
      return result.isSuccess;
    }
    setState(() {});
    return true;
  }
}

///endregion

///region normal text input
final class NormalTextInputWidget extends TextInputWidgetBase {
  final String? label;
  final Widget? leading;
  final Widget? suffix;

  const NormalTextInputWidget({
    super.key,
    super.autoFocus,
    super.boxConstraints,
    super.constraintManager,
    super.controller,
    super.enable,
    super.focusNode,
    super.hintText,
    super.inputFormatter,
    super.keyBoardType,
    super.maxLength,
    super.maxLine,
    super.minLine,
    super.obscureText,
    super.onChanged,
    super.onClear,
    super.onSubmit,
    super.physics,
    super.scrollController,
    super.scrollPadding,
    super.enableClear,
    super.hintStyle,
    super.labelStyle,
    super.textAlign,
    super.textStyle,
    super.enableInputConstraint,
    this.label,
    this.leading,
    this.suffix,
  });

  @override
  State<StatefulWidget> createState() => NormalTextInputWidgetState();
}

final class NormalTextInputWidgetState
    extends TextInputWidgetBaseState<NormalTextInputWidget> {
  @override
  Widget? buildLabel(AppTheme theme) {
    if (widget.label != null) {
      return Text(
        widget.label!,
        style: widget.labelStyle ??
            AppTypography.bodyLargeSemiBold.copyWith(
              color: theme.greyScaleColor900,
            ),
      );
    }
    return null;
  }

  @override
  Widget buildTextInput(AppTheme theme) {
    List<Widget> inputs = [];
    if (widget.leading != null) {
      inputs.add(widget.leading!);
      inputs.add(
        const SizedBox(
          width: BoxSize.boxSize04,
        ),
      );
    }

    inputs.add(
      Expanded(
        child: super.buildTextInput(
          theme,
        ),
      ),
    );

    if (widget.suffix != null) {
      inputs.add(
        const SizedBox(
          width: BoxSize.boxSize04,
        ),
      );
      inputs.add(widget.suffix!);
    }
    return Row(
      children: inputs,
    );
  }
}

///endregion

///region text input with only text field widget
final class TextInputOnlyTextFieldWidget extends TextInputWidgetBase {
  final Widget? leading;
  final Widget? suffix;

  const TextInputOnlyTextFieldWidget({
    super.obscureText,
    super.autoFocus,
    super.constraintManager,
    super.scrollController,
    super.enable,
    super.inputFormatter,
    super.focusNode,
    super.controller,
    super.hintText,
    super.scrollPadding,
    super.keyBoardType,
    super.maxLength,
    super.onSubmit,
    super.maxLine,
    super.minLine,
    super.onChanged,
    super.physics,
    super.key,
    super.onClear,
    super.boxConstraints,
    super.enableClear,
    super.hintStyle,
    super.labelStyle,
    super.textAlign,
    super.textStyle,
    super.enableInputConstraint,
    this.leading,
    this.suffix,
  });

  @override
  State<StatefulWidget> createState() => TextInputOnlyTextFieldWidgetState();
}

final class TextInputOnlyTextFieldWidgetState
    extends TextInputWidgetBaseState<TextInputOnlyTextFieldWidget> {
  @override
  Widget? buildLabel(AppTheme theme) {
    return null;
  }

  @override
  Widget buildTextInput(AppTheme theme) {
    List<Widget> inputs = [];
    if (widget.leading != null) {
      inputs.add(widget.leading!);
      inputs.add(
        const SizedBox(
          width: BoxSize.boxSize04,
        ),
      );
    }

    inputs.add(
      Expanded(
        child: super.buildTextInput(
          theme,
        ),
      ),
    );

    if (widget.suffix != null) {
      inputs.add(
        const SizedBox(
          width: BoxSize.boxSize04,
        ),
      );
      inputs.add(widget.suffix!);
    }
    return Row(
      children: inputs,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (theme) {
        return buildTextInput(theme);
      },
    );
  }
}

///endregion

///region text input with box form widget
final class TextInputWithBoxFormWidget extends TextInputWidgetBase {
  final Widget? leading;
  final Widget? suffix;
  final String? label;

  const TextInputWithBoxFormWidget({
    super.obscureText,
    super.autoFocus,
    super.constraintManager,
    super.scrollController,
    super.enable,
    super.inputFormatter,
    super.focusNode,
    super.controller,
    super.hintText,
    super.scrollPadding,
    super.keyBoardType,
    super.maxLength,
    super.onSubmit,
    super.maxLine,
    super.minLine,
    super.onChanged,
    super.physics,
    super.key,
    super.onClear,
    super.boxConstraints,
    super.enableClear,
    super.hintStyle,
    super.labelStyle,
    super.textAlign,
    super.textStyle,
    super.enableInputConstraint,
    this.leading,
    this.suffix,
    this.label,
  });

  @override
  State<StatefulWidget> createState() => TextInputWithBoxFormWidgetState();
}

final class TextInputWithBoxFormWidgetState
    extends TextInputWidgetBaseState<TextInputWithBoxFormWidget> {
  @override
  Widget? buildLabel(AppTheme theme) {
    if (widget.label != null) {
      return Text(
        widget.label!,
        style: widget.labelStyle ?? AppTypography.bodyLargeSemiBold.copyWith(
          color: theme.greyScaleColor900,
        ),
      );
    }
    return null;
  }

  @override
  Widget buildTextInput(AppTheme theme) {
    List<Widget> inputs = [];
    if (widget.leading != null) {
      inputs.add(widget.leading!);
      inputs.add(
        const SizedBox(
          width: BoxSize.boxSize04,
        ),
      );
    }

    inputs.add(
      Expanded(
        child: super.buildTextInput(
          theme,
        ),
      ),
    );

    if (widget.suffix != null) {
      inputs.add(
        const SizedBox(
          width: BoxSize.boxSize04,
        ),
      );
      inputs.add(widget.suffix!);
    }
    return Row(
      children: inputs,
    );
  }

  @override
  Widget inputFormBuilder(
    BuildContext context,
    Widget child,
    AppTheme theme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildLabel(theme) != null
            ? Column(
                children: [
                  buildLabel(theme)!,
                  const SizedBox(
                    height: BoxSize.boxSize02,
                  ),
                ],
              )
            : const SizedBox(),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.spacing04,
            vertical: Spacing.spacing03,
          ),
          constraints: widget.boxConstraints,
          decoration: BoxDecoration(
            color: theme.greyScaleColor100,
            borderRadius: BorderRadius.circular(
              BorderRadiusSize.borderRadius04,
            ),
          ),
          alignment: Alignment.center,
          child: child,
        ),
        errorMessage.isNotNullOrEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: BoxSize.boxSize03,
                  ),
                  Text(
                    errorMessage!,
                    style: AppTypography.bodyMediumMedium.copyWith(
                      color: theme.otherColorRed,
                    ),
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}

///endregion
