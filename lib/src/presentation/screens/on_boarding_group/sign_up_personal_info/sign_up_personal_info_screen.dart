import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/flutter_toast.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_personal_info/widgets/sign_up_personal_info_bottom_widget.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_personal_info/widgets/sign_up_personal_info_content_widget.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_personal_info/widgets/sign_up_personal_info_input_form_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/base_screen.dart';

class SignupPersonalInfoScreen extends StatefulWidget {
  const SignupPersonalInfoScreen({super.key});

  @override
  State<SignupPersonalInfoScreen> createState() =>
      _SignupPersonalInfoScreenState();
}

class _SignupPersonalInfoScreenState extends State<SignupPersonalInfoScreen> with StateFulBaseScreen , CustomFlutterToast{
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget child(BuildContext context, AppTheme appTheme, AppLocalizationManager localization) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SignupPersonalInfoContentWidget(
                  localization: localization,
                  appTheme: appTheme,
                ),
                SignupPersonalInfoInputFormWidget(
                  fullNameController: _fullNameController,
                  phoneNumberController: _phoneController,
                  addressController: _addressController,
                  appTheme: appTheme,
                  localization: localization,
                ),
              ],
            ),
          ),
        ),
        SignupPersonalInfoBottomWidget(
          appTheme: appTheme,
          localization: localization,
          onSkip: () {},
          onContinue: () {
            AppNavigator.push(
              RoutePath.signupCreatePublicProfile,
            );
          },
        ),
      ],
    );
  }

  @override
  Widget wrapBuild(BuildContext context, Widget child, AppTheme appTheme, AppLocalizationManager localization) {
    return Scaffold(
      appBar: AppBarStepWidget(
        appTheme: appTheme,
        currentStep: 2,
      ),
      body: child,
    );
  }

  void _listenStateChange(){

  }
}
