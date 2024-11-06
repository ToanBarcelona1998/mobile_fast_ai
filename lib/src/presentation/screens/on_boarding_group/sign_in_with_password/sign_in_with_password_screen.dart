import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'widgets/sub_login_form_widget.dart';
import 'widgets/login_form_widget.dart';
import 'widgets/welcome_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';

class SignInWithPasswordScreen extends StatefulWidget {
  const SignInWithPasswordScreen({super.key});

  @override
  State<SignInWithPasswordScreen> createState() =>
      _SignInWithPasswordScreenState();
}

class _SignInWithPasswordScreenState extends State<SignInWithPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

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
              backgroundColor: appTheme.bodyBackGroundColor,
              appBar: NormalAppBar(
                appTheme: appTheme,
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: BoxSize.boxSize05,
                    vertical: BoxSize.boxSize07,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            WelcomeWidget(
                              localization: localization,
                              appTheme: appTheme,
                            ),
                            const SizedBox(
                              height: BoxSize.boxSize07,
                            ),
                            LoginFormWidget(
                              emailController: _emailController,
                              passwordController: _passwordController,
                              localization: localization,
                              appTheme: appTheme,
                              onRememberChanged: (p0) {},
                              onChangeObscurePassword: () {},
                            ),
                            const SizedBox(
                              height: BoxSize.boxSize07,
                            ),
                            SubLoginFormWidget(
                              appTheme: appTheme,
                              localization: localization,
                              onSignUpTap: () {
                                AppNavigator.push(
                                  RoutePath.signupForm,
                                );
                              },
                              onForgotPasswordTap: () {
                                AppNavigator.push(
                                  RoutePath.resetPassword,
                                );
                              },
                              onGoogleTap: () {},
                              onAppleTap: () {},
                              onFacebookTap: () {},
                              onTwitterTap: () {},
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: BoxSize.boxSize05,
                      ),
                      PrimaryAppButton(
                        text: localization.translate(
                          LanguageKey.onBoardingSignInWithPasswordScreenSignIn,
                        ),
                        onPress: _onSignIn,
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

  void _onSignIn() {
    AppNavigator.replaceAllWith(
      RoutePath.home,
    );
  }
}
