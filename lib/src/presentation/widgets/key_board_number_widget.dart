import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/material.dart';

typedef KeyboardTapCallback = void Function(String text);

class KeyboardNumberWidget extends StatefulWidget {
  final Widget? rightIcon;
  final VoidCallback? rightButtonFn;
  final KeyboardTapCallback onKeyboardTap;
  final MainAxisAlignment mainAxisAlignment;
  final AppTheme appTheme;

  const KeyboardNumberWidget({
    Key? key,
    required this.onKeyboardTap,
    required this.appTheme,
    this.rightButtonFn,
    this.rightIcon,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _KeyboardNumberWidgetState();
  }
}

class _KeyboardNumberWidgetState extends State<KeyboardNumberWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.spacing08,
        vertical: Spacing.spacing07,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(
            BorderRadiusSize.borderRadius06,
          ),
          topRight: Radius.circular(
            BorderRadiusSize.borderRadius06,
          ),
        ),
        color: widget.appTheme.greyScaleColor50,
      ),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('1'),
              _calcButton('2'),
              _calcButton('3'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('4'),
              _calcButton('5'),
              _calcButton('6'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('7'),
              _calcButton('8'),
              _calcButton('9'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: Spacing.spacing10,
                height: Spacing.spacing10,
              ),
              _calcButton('0'),
              InkWell(
                borderRadius: BorderRadius.circular(
                  BorderRadiusSize.borderRadius06,
                ),
                onTap: widget.rightButtonFn,
                child: Container(
                  alignment: Alignment.center,
                  width: BoxSize.boxSize10,
                  height: BoxSize.boxSize10,
                  child: widget.rightIcon,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _calcButton(String value) {
    return InkWell(
      borderRadius: BorderRadius.circular(
        BorderRadiusSize.borderRadius06,
      ),
      onTap: () {
        widget.onKeyboardTap(value);
      },
      child: Container(
        alignment: Alignment.center,
        width: BoxSize.boxSize10,
        height: BoxSize.boxSize11,
        child: Text(
          value,
          style: AppTypography.heading4Medium.copyWith(
            color: widget.appTheme.greyScaleColor900,
          ),
        ),
      ),
    );
  }
}
