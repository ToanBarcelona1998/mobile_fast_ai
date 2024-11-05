import 'dart:async';

import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  final Duration duration;
  final TextStyle? textStyle;
  final VoidCallback? onCountDownDone;

  const CounterWidget({
    required this.duration,
    this.textStyle,
    this.onCountDownDone,
    super.key,
  });

  @override
  State<CounterWidget> createState() => CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  late Timer _timer;

  late int _counter;

  @override
  void initState() {
    setUpCountdown();
    super.initState();
  }

  void _onCountDown(Timer timer) {
    _counter -= 1;

    setState(() {});

    if (_counter == 0) {
      widget.onCountDownDone?.call();
      _timer.cancel();
      return;
    }
  }

  void setUpCountdown(){
    _counter = widget.duration.inSeconds;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      _onCountDown,
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _counter.toString(),
      style: widget.textStyle ?? AppTypography.bodyXLargeMedium,
    );
  }
}
