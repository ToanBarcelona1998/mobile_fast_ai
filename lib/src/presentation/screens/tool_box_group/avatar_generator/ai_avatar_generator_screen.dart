import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'widgets/bottom_widget.dart';
import 'widgets/instruction_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class AIAvatarGeneratorScreen extends StatelessWidget {
  const AIAvatarGeneratorScreen({super.key});

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
                  LanguageKey.aiAvatarScreenAppBarTitle,
                ),
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Spacing.spacing05,
                          vertical: Spacing.spacing07,
                        ),
                        children: [
                          Text(
                            localization.translate(
                              LanguageKey.aiAvatarScreenTitle,
                            ),
                            style: AppTypography.heading4Bold.copyWith(
                              color: appTheme.greyScaleColor900,
                            ),
                          ),
                          const SizedBox(
                            height: BoxSize.boxSize05,
                          ),
                          AvatarGeneratorInstructionWidget(
                            appTheme: appTheme,
                            localization: localization,
                          ),
                        ],
                      ),
                    ),
                    AvatarGeneratorBottomWidget(
                      appTheme: appTheme,
                      localization: localization,
                      onTap: () {
                        AppNavigator.push(RoutePath.avatarGeneratorUpload);
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
