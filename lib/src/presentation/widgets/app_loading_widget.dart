import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math show sin, pi;

class _DelayTween extends Tween<double> {
  _DelayTween({
    double? begin,
    double? end,
    required this.delay,
  }) : super(begin: begin, end: end);

  final double delay;

  @override
  double lerp(double t) {
    return super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);
  }

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}

class AppLoadingWidget extends StatefulWidget {
  const AppLoadingWidget({
    Key? key,
    this.color,
    this.size = 50.0,
    this.itemBuilder,
    this.duration = const Duration(
      milliseconds: 1200,
    ),
    this.controller,
  }) : super(key: key);

  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  State<AppLoadingWidget> createState() => _AppLoadingWidgetState();
}

class _AppLoadingWidgetState extends State<AppLoadingWidget>
    with SingleTickerProviderStateMixin {
  static const _itemCount = 12;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Stack(
          children: List.generate(
            _itemCount,
            (index) {
              final position = widget.size * .5;
              return Positioned.fill(
                left: position,
                top: position,
                child: Transform(
                  transform: Matrix4.rotationZ(30.0 * index * 0.0174533),
                  child: Align(
                    alignment: Alignment.center,
                    child: ScaleTransition(
                      scale: _DelayTween(
                        begin: 0.0,
                        end: 1.0,
                        delay: index / _itemCount,
                      ).animate(_controller),
                      child: AppThemeBuilder(
                        builder: (appTheme) {
                          return SizedBox.fromSize(
                            size: Size.square(widget.size * 0.15),
                            child: _itemBuilder(
                              index,
                              appTheme,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index, AppTheme appTheme) =>
      widget.itemBuilder != null
          ? widget.itemBuilder!(context, index)
          : DecoratedBox(
              decoration: BoxDecoration(
                color: widget.color ?? appTheme.primaryColor900,
                shape: BoxShape.circle,
              ),
            );
}
