import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/text_to_pattern/widgets/bottom_widget.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/text_to_pattern/widgets/content_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class TextToPatternScreen extends StatefulWidget {
  const TextToPatternScreen({super.key});

  @override
  State<TextToPatternScreen> createState() => _TextToPatternScreenState();
}

class _TextToPatternScreenState extends State<TextToPatternScreen> {
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
                  LanguageKey.textToPatternScreenAppBarTitle,
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
                          child: TextToPatternContentWidget(
                            appTheme: appTheme,
                            localization: localization,
                            promptController: _promptController,
                          ),
                        ),
                      ),
                    ),
                    TextToPatternBottomWidget(
                      localization: localization,
                      onTap: () {
                        AppNavigator.push(
                          RoutePath.textToPatternEditArtWork,
                        );
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
