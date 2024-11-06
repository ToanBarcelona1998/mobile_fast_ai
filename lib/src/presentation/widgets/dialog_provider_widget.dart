import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'app_loading_widget.dart';

abstract interface class _DialogProviderWidget extends StatelessWidget {
  const _DialogProviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (appTheme) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.spacing06,
          vertical: Spacing.spacing07,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (headerBuilder(context, appTheme) != null) ...[
              headerBuilder(context, appTheme)!,
              const SizedBox(
                height: BoxSize.boxSize06,
              ),
            ],
            SingleChildScrollView(
              child: contentBuilder(context, appTheme),
            ),
            if (bottomBuilder(context, appTheme) != null) ...[
              const SizedBox(
                height: BoxSize.boxSize06,
              ),
              bottomBuilder(context, appTheme)!,
            ]
          ],
        ),
      ),
    );
  }

  Widget contentBuilder(BuildContext context, AppTheme appTheme);

  Widget? bottomBuilder(BuildContext context, AppTheme appTheme);

  Widget? headerBuilder(BuildContext context, AppTheme appTheme);
}

final class _LoadingDialog extends _DialogProviderWidget {
  final String content;

  const _LoadingDialog({
    required this.content,
    super.key,
  });

  @override
  Widget? bottomBuilder(BuildContext content, AppTheme appTheme) {
    return null;
  }

  @override
  Widget contentBuilder(BuildContext context, AppTheme appTheme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: BoxSize.boxSize07,
        ),
        const AppLoadingWidget(),
        const SizedBox(
          height: BoxSize.boxSize09,
        ),
        Text(
          content,
          style: AppTypography.bodyMediumMedium.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize07,
        ),
      ],
    );
  }

  @override
  Widget? headerBuilder(BuildContext context, AppTheme appTheme) {
    return null;
  }
}

final class _SuccessfulDialog extends _DialogProviderWidget {
  final String title;
  final String content;
  final Widget Function(BuildContext context, AppTheme appTheme)
      bottomWidgetBuilder;

  const _SuccessfulDialog({
    required this.content,
    required this.title,
    required this.bottomWidgetBuilder,
    super.key,
  });

  @override
  Widget? bottomBuilder(BuildContext context, AppTheme appTheme) {
    return bottomWidgetBuilder(context, appTheme);
  }

  @override
  Widget contentBuilder(BuildContext context, AppTheme appTheme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: BoxSize.boxSize07,
        ),
        Text(
          title,
          style: AppTypography.heading4Bold.copyWith(
            color: appTheme.primaryColor900,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        Text(
          content,
          style: AppTypography.bodyLargeRegular.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
      ],
    );
  }

  @override
  Widget? headerBuilder(BuildContext context, AppTheme appTheme) {
    return SvgPicture.asset(
      AssetIconPath.icCommonDialogSuccessful,
    );
  }
}

sealed class DialogProvider {
  static Widget _mainDialog(
    Widget child, {
    bool canBack = true,
    required AppTheme appTheme,
    EdgeInsets? insetPadding,
  }) {
    return PopScope(
      canPop: canBack,
      child: Dialog(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            BorderRadiusSize.borderRadius06,
          ),
        ),
        backgroundColor: appTheme.bodyBackGroundColor,
        insetPadding: insetPadding ??
            const EdgeInsets.symmetric(
              horizontal: Spacing.spacing05,
              vertical: Spacing.spacing04,
            ),
        child: child,
      ),
    );
  }

  static Future<void> showLoadingDialog(
    BuildContext context, {
    required String content,
    required AppTheme appTheme,
  }) async {
    showDialog(
      context: context,
      builder: (_) {
        return _mainDialog(
          _LoadingDialog(
            content: content,
          ),
          canBack: false,
          appTheme: appTheme,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: Spacing.spacing06,
            vertical: Spacing.spacing04,
          ),
        );
      },
    );
  }

  static Future<void> showSuccessfulDialog(
    BuildContext context, {
    required String content,
    required String title,
    required AppTheme appTheme,
    required Widget Function(BuildContext context, AppTheme appTheme)
        bottomWidgetBuilder,
  }) async {
    showDialog(
      context: context,
      builder: (_) {
        return _mainDialog(
          _SuccessfulDialog(
            content: content,
            title: title,
            bottomWidgetBuilder: bottomWidgetBuilder,
          ),
          canBack: false,
          appTheme: appTheme,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: Spacing.spacing06,
            vertical: Spacing.spacing04,
          ),
        );
      },
    );
  }

  static Future<T?> showCustomDialog<T>(
    BuildContext context, {
    required AppTheme appTheme,
    required Widget widget,
    EdgeInsets? insetPadding,
    bool canBack = false,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) {
        return _mainDialog(
          widget,
          appTheme: appTheme,
          insetPadding: insetPadding,
          canBack: canBack,
        );
      },
    );
  }
}
