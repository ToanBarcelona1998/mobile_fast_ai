import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CreateNewPasscodeFormWidget extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasscodeController;
  final AppLocalizationManager localization;
  final AppTheme appTheme;
  final bool obscurePassword;
  final bool obscureConfirmPassword;
  final VoidCallback onChangeObscurePassword;
  final VoidCallback onChangeObscureConfirmPassword;

  const CreateNewPasscodeFormWidget({
    required this.confirmPasscodeController,
    required this.passwordController,
    required this.localization,
    required this.appTheme,
    required this.obscurePassword,
    required this.obscureConfirmPassword,
    required this.onChangeObscurePassword,
    required this.onChangeObscureConfirmPassword,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NormalTextInputWidget(
          controller: passwordController,
          label: localization.translate(
            LanguageKey.onBoardingCreateNewPasswordScreenNewPassword,
          ),
          hintText: localization.translate(
            LanguageKey.onBoardingCreateNewPasswordScreenNewPasswordHint,
          ),
          maxLine: 1,
          obscureText: obscurePassword,
          suffix: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onChangeObscurePassword,
            child: obscurePassword
                ? SvgPicture.asset(
                    AssetIconPath.icCommonEyeHide,
                  )
                : SvgPicture.asset(
                    AssetIconPath.icCommonEyeHide,
                  ),
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize07,
        ),
        NormalTextInputWidget(
          controller: confirmPasscodeController,
          label: localization.translate(
            LanguageKey.onBoardingCreateNewPasswordScreenConfirmNewPassword,
          ),
          hintText: localization.translate(
            LanguageKey.onBoardingCreateNewPasswordScreenConfirmNewPasswordHint,
          ),
          constraintManager: ConstraintManager()
            ..custom(
              errorMessage: localization.translate(''),
              customValid: (value) {
                return value == passwordController.text.trim();
              },
            ),
          maxLine: 1,
          obscureText: obscureConfirmPassword,
          suffix: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onChangeObscureConfirmPassword,
            child: obscurePassword
                ? SvgPicture.asset(
                    AssetIconPath.icCommonEyeHide,
                  )
                : SvgPicture.asset(
                    AssetIconPath.icCommonEyeHide,
                  ),
          ),
        ),
      ],
    );
  }
}
