import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/create_new_password/widgets/create_new_passcode_form_widget.dart';
import 'widgets/create_new_password_content_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                    vertical: Spacing.spacing07,
                    horizontal: Spacing.spacing05,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            CreateNewPasscodeContentWidget(
                              appTheme: appTheme,
                              localization: localization,
                            ),
                            CreateNewPasscodeFormWidget(
                              confirmPasscodeController:
                                  _confirmPasswordController,
                              passwordController: _passwordController,
                              localization: localization,
                              appTheme: appTheme,
                              obscurePassword: true,
                              obscureConfirmPassword: true,
                              onChangeObscurePassword: () {

                              },
                              onChangeObscureConfirmPassword:
                                  () {

                                  },
                            ),
                          ],
                        ),
                      ),
                      PrimaryAppButton(
                        text: localization.translate(
                          LanguageKey.onBoardingCreateNewPasswordScreenContinue,
                        ),
                        onPress: _onContinue,
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

  void _onContinue(){

  }
}
