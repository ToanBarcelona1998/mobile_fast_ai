import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_in_with_password/sign_in_with_password_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_in_with_password/sign_in_with_password_event.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_in_with_password/sign_in_with_password_selector.dart';
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

  const LoginFormWidget({
    required this.emailController,
    required this.passwordController,
    required this.localization,
    required this.appTheme,
    required this.onRememberChanged,
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
          onChanged: (userName, _) {
            _onUserNameChange(context, userName);
          },
        ),
        const SizedBox(
          height: BoxSize.boxSize07,
        ),
        SignInWithPasswordHidePasswordSelector(builder: (hidePassword) {
          return NormalTextInputWidget(
            controller: passwordController,
            label: localization.translate(
              LanguageKey.onBoardingSignInWithPasswordScreenPasswordLabel,
            ),
            hintText: localization.translate(
              LanguageKey.onBoardingSignInWithPasswordScreenPasswordHint,
            ),
            maxLine: 1,
            obscureText: hidePassword,
            onChanged: (password, _) {
              _onPasswordChange(context, password);
            },
            suffix: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _onChangeObscurePassword(context),
              child: hidePassword
                  ? SvgPicture.asset(
                      AssetIconPath.icCommonEyeHide,
                    )
                  : SvgPicture.asset(
                      AssetIconPath.icCommonEyeHide,
                    ),
            ),
          );
        }),
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

  void _onUserNameChange(BuildContext context, String email) {
    SignInWithPasswordBloc.of(context).add(
      SignInWithPasswordEventOnUserNameChange(
        email,
      ),
    );
  }

  void _onPasswordChange(BuildContext context, String password) {
    SignInWithPasswordBloc.of(context).add(
      SignInWithPasswordEventOnPasswordChange(
        password,
      ),
    );
  }

  void _onChangeObscurePassword(BuildContext context) {
    SignInWithPasswordBloc.of(context).add(
      const SignInWithPasswordEventOnHidePasswordChange(),
    );
  }
}
