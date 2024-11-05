import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bottom_sheet_provider.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

class SettingLogoutWidget extends AppBottomSheetProviderWidget {
  final AppLocalizationManager localization;
  final VoidCallback onAgree;

  const SettingLogoutWidget({
    required super.appTheme,
    required this.localization,
    required this.onAgree,
    super.fit = ChoiceModalFit.fill,
    super.key,
  });

  @override
  Widget? bottomBuilder(BuildContext context, AppTheme appTheme) {
    return Row(
      children: [
        Expanded(
          child: PrimaryAppButton(
            text: localization.translate(
              LanguageKey.settingScreenLogoutCancel,
            ),
            backGroundColor: appTheme.primaryColor50,
            textStyle: AppTypography.bodyLargeSemiBold.copyWith(
              color: appTheme.primaryColor900,
            ),
            onPress: () => AppNavigator.pop(),
          ),
        ),
        const SizedBox(
          width: BoxSize.boxSize04,
        ),
        Expanded(
          child: PrimaryAppButton(
            text: localization.translate(
              LanguageKey.settingScreenLogoutAgree,
            ),
            onPress: onAgree,
          ),
        ),
      ],
    );
  }

  @override
  Widget contentBuilder(BuildContext context, AppTheme appTheme) {
    return Column(
      children: [
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        HoLiZonTalDividerWidget(
          appTheme: appTheme,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        Text(
          localization.translate(
            LanguageKey.settingScreenLogoutContent,
          ),
          style: AppTypography.heading5Bold.copyWith(
            color: appTheme.greyScaleColor900,
          ),
        ),
      ],
    );
  }

  @override
  Widget? titleBuilder(BuildContext context, AppTheme appTheme) {
    return Center(
      child: Text(
        localization.translate(
          LanguageKey.settingScreenLogoutTitle,
        ),
        style: AppTypography.heading4Bold.copyWith(
          color: appTheme.statusColorError,
        ),
      ),
    );
  }
}
