import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'widgets/bottom_widget.dart';
import 'widgets/content_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class TextEffectOwnScreen extends StatefulWidget {
  const TextEffectOwnScreen({super.key});

  @override
  State<TextEffectOwnScreen> createState() => _TextEffectOwnScreenState();
}

class _TextEffectOwnScreenState extends State<TextEffectOwnScreen> {
  final TextEditingController _textEffectController = TextEditingController();
  final TextEditingController _describeController = TextEditingController();

  @override
  void dispose() {
    _textEffectController.dispose();
    _describeController.dispose();
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
                  LanguageKey.textEffectOwnScreenAppBarTitle,
                ),
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: TextEffectOwnContentWidget(
                          describeController: _describeController,
                          textEffectController: _textEffectController,
                          localization: localization,
                          appTheme: appTheme,
                        ),
                      ),
                    ),
                    TextEffectOwnBottomWidget(
                      localization: localization,
                      appTheme: appTheme,
                      onGenerate: () {
                        AppNavigator.push(
                          RoutePath.textEffectEditArtWork,
                          {
                            'text' : _textEffectController.text.trim(),
                            'describe' : _describeController.text.trim(),
                          },
                        );
                      },
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
