import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/grid_image_picker_widget.dart';
import 'package:flutter/material.dart';

class AvatarGeneratorUploadFormWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final List<String> choseFiles;
  final void Function(List<String> files) onChanged;
  final VoidCallback onGenerated;

  const AvatarGeneratorUploadFormWidget({
    required this.appTheme,
    required this.localization,
    required this.choseFiles,
    required this.onChanged,
    required this.onGenerated,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.spacing05,
              vertical: Spacing.spacing07,
            ),
            child: Column(
              children: [
                Text(
                  localization
                      .translateWithParam(LanguageKey.aiAvatarUploadScreenTitle, {
                    'number': choseFiles.length,
                  }),
                  style: AppTypography.heading4Bold.copyWith(
                    color: appTheme.greyScaleColor900,
                  ),
                ),
                const SizedBox(
                  height: BoxSize.boxSize05,
                ),
                Expanded(
                  child: GridImagePickerWidget(
                    label: localization.translate(
                      LanguageKey.aiAvatarUploadScreenUploadMore,
                    ),
                    imageFiles: choseFiles,
                    appTheme: appTheme,
                    count: 10,
                    onChanged: onChanged,
                  ),
                ),
              ],
            ),
          ),
        ),
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
              LanguageKey.aiAvatarUploadScreenGenerate,
            ),
            onPress: onGenerated,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
      ],
    );
  }
}
