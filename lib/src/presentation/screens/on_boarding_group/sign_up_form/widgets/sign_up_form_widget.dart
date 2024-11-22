import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_form/sign_up_form_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_form/sign_up_form_event.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_form/sign_up_form_selector.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/check_box_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_manager.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupFormWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final AppLocalizationManager localization;
  final AppTheme appTheme;
  final void Function(bool?) onRememberChanged;

  const SignupFormWidget({
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
            LanguageKey.onBoardingSignupFormScreenEmail,
          ),
          onChanged: (email, _) {
            _onEmailChange(context, email);
          },
          hintText: localization.translate(
            LanguageKey.onBoardingSignupFormScreenEmailHint,
          ),
          constraintManager: ConstraintManager()
            ..email(
              errorMessage: localization.translate(
                LanguageKey.onBoardingSignupFormScreenEmailInvalid,
              ),
            ),
          suffix: SvgPicture.asset(
            AssetIconPath.icCommonEmail,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize07,
        ),
        SignUpFormHidePasswordSelector(builder: (obscurePassword) {
          return NormalTextInputWidget(
            controller: passwordController,
            label: localization.translate(
              LanguageKey.onBoardingSignupFormScreenPassword,
            ),
            hintText: localization.translate(
              LanguageKey.onBoardingSignupFormScreenPasswordHint,
            ),
            maxLine: 1,
            obscureText: obscurePassword,
            onChanged: (password, _) {
              _onPasswordChange(context, password);
            },
            constraintManager: ConstraintManager()
              ..notEmpty(
                errorMessage: localization.translate(
                  LanguageKey.onBoardingSignupFormScreenPasswordInvalid,
                ),
              ),
            suffix: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => _onChangeObscurePassword(context),
              child: obscurePassword
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
          labelWidget: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: localization.translate(
                    LanguageKey.onBoardingSignupFormScreenAgreeTerm,
                  ),
                  style: AppTypography.bodyLargeSemiBold.copyWith(
                    color: appTheme.greyScaleColor900,
                  ),
                ),
                TextSpan(
                    text: ' ${localization.translate(
                      LanguageKey.onBoardingSignupFormScreenTerm,
                    )}',
                    style: AppTypography.bodyLargeSemiBold.copyWith(
                      color: appTheme.primaryColor900,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //
                      }),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _onPasswordChange(BuildContext context, String password) {
    SignUpFormBloc.of(context).add(
      SignUpFormOnChangePasswordEvent(password),
    );
  }

  void _onEmailChange(BuildContext context, String email) {
    SignUpFormBloc.of(context).add(
      SignUpFormOnChangeEmailEvent(email),
    );
  }

  void _onChangeObscurePassword(BuildContext context) {
    SignUpFormBloc.of(context).add(
      const SignUpFormOnChangeHidePasswordEvent(),
    );
  }
}
