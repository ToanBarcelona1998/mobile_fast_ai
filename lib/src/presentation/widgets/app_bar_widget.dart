import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/cores/utils/dart_core_extension.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract interface class _AppBarBase extends StatelessWidget
    implements PreferredSizeWidget {
  final VoidCallback? onBack;
  final AppTheme appTheme;
  final double? leadingWidth;

  const _AppBarBase({
    this.leadingWidth,
    this.onBack,
    required this.appTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leadingBuilder(context, appTheme) ??
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (onBack == null) {
                AppNavigator.pop();
              } else {
                onBack!.call();
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
              ),
              child: SvgPicture.asset(
                AssetIconPath.icCommonArrowBack,
              ),
            ),
          ),
      leadingWidth: leadingWidth,
      title: titleBuilder(context, appTheme),
      centerTitle: true,
      bottom: bottomBuilder(appTheme),
      actions: actionBuilders(context, appTheme),
      backgroundColor: appTheme.bodyBackGroundColor,
      elevation: 0,
    );
  }

  Widget? leadingBuilder(BuildContext context, AppTheme appTheme);

  List<Widget>? actionBuilders(BuildContext context, AppTheme appTheme);

  PreferredSizeWidget? bottomBuilder(AppTheme appTheme);

  Widget titleBuilder(BuildContext context, AppTheme appTheme);

  @override
  Size get preferredSize{
    final bottom = bottomBuilder(appTheme);

    double bottomHeight = 0;

    if(bottom != null){
      bottomHeight = bottom.preferredSize.height + BoxSize.boxSize05;
    }
    return Size.fromHeight(
      (kToolbarHeight) + bottomHeight,
    );
  }
}

final class NormalAppBar extends _AppBarBase {
  final Widget? titleWidget;
  final Widget? leadingWidget;
  final String? title;
  final PreferredSizeWidget? bottomWidget;
  final List<Widget>? actions;

  const NormalAppBar({
    required super.appTheme,
    super.key,
    super.leadingWidth,
    super.onBack,
    this.titleWidget,
    this.leadingWidget,
    this.title,
    this.bottomWidget,
    this.actions,
  });

  @override
  List<Widget>? actionBuilders(BuildContext context, AppTheme appTheme) {
    return actions;
  }

  @override
  PreferredSizeWidget? bottomBuilder(AppTheme appTheme) {
    return bottomWidget;
  }

  @override
  Widget? leadingBuilder(BuildContext context, AppTheme appTheme) {
    return leadingWidget;
  }

  @override
  Widget titleBuilder(BuildContext context, AppTheme appTheme) {
    if (titleWidget != null) {
      return titleWidget!;
    }

    if (title.isNotNullOrEmpty) {
      return Text(
        title!,
        style: AppTypography.heading4Bold.copyWith(
          color: appTheme.greyScaleColor900,
        ),
      );
    }

    return const SizedBox.shrink();
  }
}

class AppBarStepWidget extends _AppBarBase {
  final Widget? leadingWidget;
  final PreferredSizeWidget? bottomWidget;
  final List<Widget>? actions;
  final int maxStep;
  final int currentStep;

  const AppBarStepWidget({
    required super.appTheme,
    super.key,
    super.leadingWidth,
    super.onBack,
    this.leadingWidget,
    this.bottomWidget,
    this.actions,
    this.maxStep = 3,
    this.currentStep = 1,
  });

  @override
  List<Widget>? actionBuilders(BuildContext context, AppTheme appTheme) {
    return actions;
  }

  @override
  PreferredSizeWidget? bottomBuilder(AppTheme appTheme) {
    return bottomWidget;
  }

  @override
  Widget? leadingBuilder(BuildContext context, AppTheme appTheme) {
    return leadingWidget;
  }

  @override
  Widget titleBuilder(BuildContext context, AppTheme appTheme) {
    return _StepWidget(
      appTheme: appTheme,
      currentStep: currentStep,
      maxStep: maxStep,
    );
  }
}

class _StepWidget extends StatelessWidget {
  final int maxStep;
  final int currentStep;
  final AppTheme appTheme;

  const _StepWidget({
    this.maxStep = 3,
    this.currentStep = 1,
    required this.appTheme,
    super.key,
  }) : assert(currentStep > 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: BoxSize.boxSize04,
      width: context.w / 2,
      decoration: BoxDecoration(
        color: appTheme.greyScaleColor200,
        borderRadius: BorderRadius.circular(
          BorderRadiusSize.borderRadiusRound,
        ),
      ),
      child: Row(
        children: List.generate(
          maxStep,
          (index) {
            final bool hasNextStep = currentStep - 1 > index;
            final bool beingCurrentStep = currentStep - 1 == index;

            const radius = Radius.circular(
              BorderRadiusSize.borderRadiusRound,
            );
            return Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: (hasNextStep || beingCurrentStep)
                      ? appTheme.primaryColor900
                      : appTheme.greyScaleColor200,
                  borderRadius: (index == 0 && !hasNextStep)
                      ? BorderRadius.circular(
                          BorderRadiusSize.borderRadiusRound,
                        )
                      : (index == 0 && hasNextStep)
                          ? const BorderRadius.only(
                              topLeft: radius,
                              bottomLeft: radius,
                            )
                          : index == maxStep - 1
                              ? const BorderRadius.only(
                                  topRight: radius,
                                  bottomRight: radius,
                                )
                              : beingCurrentStep
                                  ? const BorderRadius.only(
                                      topRight: radius,
                                      bottomRight: radius,
                                    )
                                  : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
