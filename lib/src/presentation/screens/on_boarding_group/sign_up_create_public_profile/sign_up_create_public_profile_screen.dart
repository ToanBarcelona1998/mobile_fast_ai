import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_create_public_profile/widgets/sign_up_create_public_profile_content_widget.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_create_public_profile/widgets/sign_up_create_public_profile_input_form_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';

class SignupCreatePublicProfileScreen extends StatefulWidget {
  const SignupCreatePublicProfileScreen({super.key});

  @override
  State<SignupCreatePublicProfileScreen> createState() =>
      _SignupCreatePublicProfileScreenState();
}

class _SignupCreatePublicProfileScreenState
    extends State<SignupCreatePublicProfileScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _nickNameController.dispose();
    _bioController.dispose();
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
              appBar: AppBarStepWidget(
                appTheme: appTheme,
                currentStep: 3,
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
                          padding: const EdgeInsets.only(
                            bottom: Spacing.spacing07,
                          ),
                          children: [
                            SignupCreatePublicProfileContentWidget(
                              localization: localization,
                              appTheme: appTheme,
                            ),
                            SignupCreatePublicProfileInputFormWidget(
                              userNameController: _userNameController,
                              nickNameController: _nickNameController,
                              bioController: _bioController,
                              appTheme: appTheme,
                              localization: localization,
                            ),
                          ],
                        ),
                      ),
                      PrimaryAppButton(
                        text: localization.translate(
                          LanguageKey.onBoardingSignupPublicProfileScreenFinish,
                        ),
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
}
