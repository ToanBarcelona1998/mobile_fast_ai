import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';

import 'app_loading_widget.dart';

mixin StatelessBaseScreen on StatelessWidget {
  EdgeInsets defaultPadding() {
    return const EdgeInsets.symmetric(
      vertical: Spacing.spacing05,
      horizontal: Spacing.spacing07,
    );
  }

  EdgeInsets? padding() {
    return null;
  }

  Widget buildSpace(
    BuildContext context,
    AppTheme appTheme,
    AppLocalizationManager localization,
  ) {
    return SafeArea(
      child: Padding(
        padding: padding() ?? defaultPadding(),
        child: child(
          context,
          appTheme,
          localization,
        ),
      ),
    );
  }

  Widget child(
    BuildContext context,
    AppTheme appTheme,
    AppLocalizationManager localization,
  );

  Widget wrapBuild(
    BuildContext context,
    Widget child,
    AppTheme appTheme,
    AppLocalizationManager localization,
  );

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (appTheme) {
        return AppLocalizationProvider(
          builder: (localization) {
            return wrapBuild(
              context,
              buildSpace(
                context,
                appTheme,
                localization,
              ),
              appTheme,
              localization,
            );
          },
        );
      },
    );
  }
}

mixin StateFulBaseScreen<T extends StatefulWidget> on State<T> {
  final loadingController = StreamController<bool>();

  Widget _buildLoader(AppTheme appTheme) {
    return Container(
      color: appTheme.darkColor5.withOpacity(0.3),
      alignment: Alignment.center,
      child: AppThemeBuilder(
        builder: (appTheme) => AppLoadingWidget(
          appTheme: appTheme,
        ),
      ),
    );
  }

  @override
  void dispose() {
    loadingController.close();

    super.dispose();
  }

  void showLoading() {
    loadingController.add(true);
  }

  void hideLoading() {
    loadingController.add(false);
  }

  EdgeInsets defaultPadding() {
    return const EdgeInsets.symmetric(
      vertical: Spacing.spacing05,
      horizontal: Spacing.spacing07,
    );
  }

  EdgeInsets? padding() {
    return null;
  }

  Widget buildSpace(
    BuildContext context,
    AppTheme appTheme,
    AppLocalizationManager localization,
  ) {
    return SafeArea(
      child: Padding(
        padding: padding() ?? defaultPadding(),
        child: child(
          context,
          appTheme,
          localization,
        ),
      ),
    );
  }

  Widget child(
    BuildContext context,
    AppTheme appTheme,
    AppLocalizationManager localization,
  );

  Widget wrapBuild(
    BuildContext context,
    Widget child,
    AppTheme appTheme,
    AppLocalizationManager localization,
  );

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (appTheme) {
        return AppLocalizationProvider(
          builder: (localization) {
            return Stack(
              fit: StackFit.expand,
              children: [
                wrapBuild(
                  context,
                  buildSpace(
                    context,
                    appTheme,
                    localization,
                  ),
                  appTheme,
                  localization,
                ),
                StreamBuilder(
                  stream: loadingController.stream,
                  builder: (_, snapshot) => snapshot.data == true
                      ? Positioned.fill(
                          child: _buildLoader(
                            appTheme,
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
