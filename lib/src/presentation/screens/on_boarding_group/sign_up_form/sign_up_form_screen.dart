import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_form/widgets/sign_up_form_widget.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_form/widgets/sub_sign_up_form_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'widgets/sign_up_form_content_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class SignupFormScreen extends StatefulWidget {
  const SignupFormScreen({super.key});

  @override
  State<SignupFormScreen> createState() => _SignupFormScreenState();
}

class _SignupFormScreenState extends State<SignupFormScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (appTheme) {
        return AppLocalizationProvider(
          builder: (localization) {
            return Scaffold(
              appBar: AppBarStepWidget(
                appTheme: appTheme,
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
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            SignupFormContentWidget(
                              localization: localization,
                              appTheme: appTheme,
                            ),
                            SignupFormWidget(
                              emailController: _emailController,
                              passwordController: _passwordController,
                              localization: localization,
                              appTheme: appTheme,
                              onRememberChanged: (value) {},
                              onChangeObscurePassword: () {},
                            ),
                            const SizedBox(
                              height: BoxSize.boxSize07,
                            ),
                            SubSignupFormWidget(
                              appTheme: appTheme,
                              localization: localization,
                              onSignInTap: () {
                                AppNavigator.pop();
                              },
                              onGoogleTap: () {},
                              onAppleTap: () {},
                              onFacebookTap: () {},
                              onTwitterTap: () {},
                            ),
                          ],
                        ),
                      ),
                      PrimaryAppButton(
                        text: localization.translate(
                          LanguageKey.onBoardingSignupFormScreenSignup,
                        ),
                        onPress: _onSignup,
                      ),
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

  void _onSignup() {
    // push some logic here
    AppNavigator.push(
      RoutePath.signupPersonalInfo,
    );
  }
}
