import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/check_box_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginFormWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final AppLocalizationManager localization;
  final AppTheme appTheme;
  final void Function(bool?) onRememberChanged;
  final bool obscurePassword;
  final VoidCallback onChangeObscurePassword;

  const LoginFormWidget({
    required this.emailController,
    required this.passwordController,
    required this.localization,
    required this.appTheme,
    required this.onRememberChanged,
    this.obscurePassword = false,
    required this.onChangeObscurePassword,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NormalTextInputWidget(
          controller: emailController,
          label: localization.translate(
            LanguageKey.onBoardingSignInWithPasswordScreenEmailLabel,
          ),
          hintText: localization.translate(
            LanguageKey.onBoardingSignInWithPasswordScreenEmailHint,
          ),
          constraintManager: ConstraintManager()
            ..email(
              errorMessage: localization.translate(''),
            ),
          suffix: SvgPicture.asset(
            AssetIconPath.icCommonEmail,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize07,
        ),
        NormalTextInputWidget(
          controller: passwordController,
          label: localization.translate(
            LanguageKey.onBoardingSignInWithPasswordScreenPasswordLabel,
          ),
          hintText: localization.translate(
            LanguageKey.onBoardingSignInWithPasswordScreenPasswordHint,
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
          height: BoxSize.boxSize05,
        ),
        CheckBoxWidget(
          appTheme: appTheme,
          onChanged: onRememberChanged,
          label: localization.translate(
            LanguageKey.onBoardingSignInWithPasswordScreenRememberMe,
          ),
        ),
      ],
    );
  }
}
