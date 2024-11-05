import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditArtWorkActionWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final VoidCallback? onRegenerateTap;
  final VoidCallback? onCreateVariationTap;
  final VoidCallback? onEraseObjectTap;
  final VoidCallback? onEditInputTap;

  const EditArtWorkActionWidget({
    required this.localization,
    required this.appTheme,
    this.onCreateVariationTap,
    this.onEditInputTap,
    this.onEraseObjectTap,
    this.onRegenerateTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: _EditArtWorkActionWidget(
              name: localization.translate(
                LanguageKey.editArtWorkScreenRegenerate,
              ),
              icPath: AssetIconPath.icEditArtWorkRegenerate,
              appTheme: appTheme,
              onTap: onRegenerateTap,
            ),
          ),
          const SizedBox(
            width: BoxSize.boxSize04,
          ),
          Expanded(
            child: _EditArtWorkActionWidget(
              name: localization.translate(
                LanguageKey.editArtWorkScreenCreateVariation,
              ),
              icPath: AssetIconPath.icEditArtWorkVariation,
              appTheme: appTheme,
              onTap: onCreateVariationTap,
            ),
          ),
          const SizedBox(
            width: BoxSize.boxSize04,
          ),
          Expanded(
            child: _EditArtWorkActionWidget(
              name: localization.translate(
                LanguageKey.editArtWorkScreenEraseObject,
              ),
              icPath: AssetIconPath.icEditArtWorkErase,
              appTheme: appTheme,
              onTap: onEraseObjectTap,
            ),
          ),
          const SizedBox(
            width: BoxSize.boxSize04,
          ),
          Expanded(
            child: _EditArtWorkActionWidget(
              name: localization.translate(
                LanguageKey.editArtWorkScreenEditInput,
              ),
              icPath: AssetIconPath.icEditArtWorkEdit,
              appTheme: appTheme,
              onTap: onEditInputTap,
            ),
          ),
        ],
      ),
    );
  }
}

class _EditArtWorkActionWidget extends StatelessWidget {
  final String icPath;
  final String name;
  final AppTheme appTheme;
  final VoidCallback? onTap;

  const _EditArtWorkActionWidget({
    required this.name,
    required this.icPath,
    required this.appTheme,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.all(
          Spacing.spacing04,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            BorderRadiusSize.borderRadius03,
          ),
          color: appTheme.primaryColor100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icPath,
            ),
            const SizedBox(
              height: BoxSize.boxSize04,
            ),
            Text(
              name,
              style: AppTypography.bodySmallSemiBold.copyWith(
                color: appTheme.primaryColor900,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
