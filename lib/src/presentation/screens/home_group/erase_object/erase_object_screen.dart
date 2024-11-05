import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/screens/home_group/erase_object/widgets/erase_object_information_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';

class EraseObjectScreen extends StatefulWidget {
  final String url;
  final String description;

  const EraseObjectScreen({
    required this.description,
    required this.url,
    super.key,
  });

  @override
  State<EraseObjectScreen> createState() => _EraseObjectScreenState();
}

class _EraseObjectScreenState extends State<EraseObjectScreen> {
  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (appTheme) {
        return AppLocalizationProvider(
          builder: (localization) {
            return Scaffold(
              backgroundColor: appTheme.bodyBackGroundColor,
              appBar: NormalAppBar(
                appTheme: appTheme,
                title: localization.translate(
                  LanguageKey.eraseObjectScreenAppBarTitle,
                ),
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.spacing05,
                    vertical: Spacing.spacing07,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: EraseObjectInformationWidget(
                          description: widget.description,
                          url: widget.url,
                          appTheme: appTheme,
                        ),
                      ),
                      PrimaryAppButton(
                        text: localization.translate(
                          LanguageKey.eraseObjectScreenErase,
                        ),
                        onPress: () {
                          AppNavigator.pop();
                        },
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
