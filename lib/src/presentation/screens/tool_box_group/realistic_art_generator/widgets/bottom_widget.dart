import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

class RealisticArtGeneratorBottomWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final VoidCallback onTap;

  const RealisticArtGeneratorBottomWidget({
    required this.appTheme,
    required this.localization,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HoLiZonTalDividerWidget(
          appTheme: appTheme,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.spacing05,
          ),
          child: PrimaryAppButton(
            text: localization.translate(
              LanguageKey.realisticArtGeneratorScreenGenerate,
            ),
            onPress: onTap,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
      ],
    );
  }
}
