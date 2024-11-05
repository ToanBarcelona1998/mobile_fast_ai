import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'widgets/bottom_widget.dart';
import 'widgets/content_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class LogoGeneratorScreen extends StatefulWidget {
  const LogoGeneratorScreen({super.key});

  @override
  State<LogoGeneratorScreen> createState() => _LogoGeneratorScreenState();
}

class _LogoGeneratorScreenState extends State<LogoGeneratorScreen> {
  final TextEditingController _promptController = TextEditingController();

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (appTheme) {
        return AppLocalizationProvider(
          builder: (localization) {
            return Scaffold(
              appBar: NormalAppBar(
                appTheme: appTheme,
                title: localization.translate(
                  LanguageKey.logoGeneratorScreenAppBarTitle,
                ),
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Spacing.spacing05,
                            vertical: Spacing.spacing07,
                          ),
                          child: LogoGeneratorContentWidget(
                            appTheme: appTheme,
                            localization: localization,
                            promptController: _promptController,
                          ),
                        ),
                      ),
                    ),
                    LogoGeneratorBottomWidget(
                      localization: localization,
                      onTap: () {
                        AppNavigator.push(RoutePath.logoGeneratorEditArtWork);
                      },
                      appTheme: appTheme,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
