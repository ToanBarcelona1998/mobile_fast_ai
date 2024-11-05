import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'widgets/sign_in_form_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/social_form_widget.dart';
import 'widgets/welcome_form_widget.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (appTheme) {
        return AppLocalizationProvider(
          builder: (localization) {
            return Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 12,
                  ),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      WelcomeFormWidget(
                        localization: localization,
                        appTheme: appTheme,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 36,
                        ),
                        child: SocialFormWidget(
                          localization: localization,
                          onGoogleTap: () {},
                          onAppleTap: () {},
                          onFacebookTap: () {},
                          onTwitterTap: () {},
                        ),
                      ),
                      SignInFormWidget(
                        localization: localization,
                        appTheme: appTheme,
                        onSignInWithPasswordTap: _onSignInWithPassword,
                        onSignupTap: () {

                        },
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

  void _onSignInWithPassword(){
    AppNavigator.push(RoutePath.signInWithPassword);
  }
}
