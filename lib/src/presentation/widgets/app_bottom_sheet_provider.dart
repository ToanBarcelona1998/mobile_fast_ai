import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/material.dart';

extension ChoiceModalFitExtension on ChoiceModalFit {
  bool get isFitContent => this == ChoiceModalFit.fill;
}

enum ChoiceModalSize {
  small,
  medium,
  high,
}

enum ChoiceModalFit {
  // Fit content size
  fill,
  // Fixed size
  fixed,
}

abstract class AppBottomSheetProviderWidget extends StatelessWidget {
  final AppTheme appTheme;
  final ChoiceModalFit fit;

  const AppBottomSheetProviderWidget({
    required this.appTheme,
    this.fit = ChoiceModalFit.fixed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Widget? title = titleBuilder(context, appTheme);
    final Widget? bottom = bottomBuilder(context, appTheme);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Spacing.spacing07,
        vertical: Spacing.spacing05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            title,
            const SizedBox(
              height: BoxSize.boxSize07,
            ),
          ],
          !fit.isFitContent
              ? Expanded(
                  child: SingleChildScrollView(
                    child: contentBuilder(
                      context,
                      appTheme,
                    ),
                  ),
                )
              : ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  children: [
                    contentBuilder(
                      context,
                      appTheme,
                    ),
                  ],
                ),
          if (bottom != null) ...[
            const SizedBox(
              height: BoxSize.boxSize07,
            ),
            bottom,
          ]
        ],
      ),
    );
  }

  Widget? titleBuilder(
    BuildContext context,
    AppTheme appTheme,
  );

  Widget contentBuilder(BuildContext context, AppTheme appTheme);

  Widget? bottomBuilder(
    BuildContext context,
    AppTheme appTheme,
  );
}

sealed class AppBottomSheetProvider {
  static Future<T?> showNormalBottomSheet<T>(
    BuildContext context, {
    required AppTheme theme,
    required Widget child,
    ChoiceModalSize modalSize = ChoiceModalSize.small,
    ChoiceModalFit fit = ChoiceModalFit.fill,
  }) async {
    return showModalBottomSheet(
      context: context,
      backgroundColor: theme.bodyBackGroundColor,
      constraints: fit.isFitContent
          ? null
          : BoxConstraints(
              maxHeight: _buildConstraint(modalSize),
            ),
      builder: (context) {
        return child;
      },
    );
  }

  static Future<T?> showHighBottomSheet<T>(
    BuildContext context, {
    required AppTheme theme,
    required Widget child,
    ChoiceModalFit fit = ChoiceModalFit.fill,
  }) {
    return showNormalBottomSheet<T>(
      context,
      theme: theme,
      child: child,
      modalSize: ChoiceModalSize.high,
      fit: fit,
    );
  }

  static Future<T?> showMediumBottomSheet<T>(
    BuildContext context, {
    required AppTheme theme,
    required Widget child,
    ChoiceModalFit fit = ChoiceModalFit.fill,
  }) {
    return showNormalBottomSheet<T>(
      context,
      theme: theme,
      child: child,
      modalSize: ChoiceModalSize.medium,
      fit: fit,
    );
  }

  static double _buildConstraint(ChoiceModalSize size) {
    switch (size) {
      case ChoiceModalSize.small:
        return BoxSize.boxSize18;
      case ChoiceModalSize.medium:
        return BoxSize.boxSize18 * 2;
      case ChoiceModalSize.high:
        return BoxSize.boxSize18 * 2.7;
    }
  }
}
