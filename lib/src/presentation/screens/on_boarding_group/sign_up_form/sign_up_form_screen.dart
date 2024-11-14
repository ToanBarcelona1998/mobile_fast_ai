import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_fast_ai/config/di.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/flutter_toast.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'sign_up_form_event.dart';
import 'sign_up_form_selector.dart';
import 'sign_up_form_state.dart';
import 'sign_up_form_bloc.dart';
import 'widgets/sign_up_form_widget.dart';
import 'widgets/sub_sign_up_form_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/base_screen.dart';
import 'widgets/sign_up_form_content_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class SignupFormScreen extends StatefulWidget {
  const SignupFormScreen({super.key});

  @override
  State<SignupFormScreen> createState() => _SignupFormScreenState();
}

class _SignupFormScreenState extends State<SignupFormScreen>
    with StateFulBaseScreen, CustomFlutterToast {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final SignUpFormBloc _bloc = getIt.get<SignUpFormBloc>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSignup() {
    _bloc.add(
      const SignUpFormOnSubmitEvent(),
    );
  }

  @override
  Widget child(BuildContext context, AppTheme appTheme,
      AppLocalizationManager localization) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
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
        ),
        SignUpFormIsReadySubmitSelector(
          builder: (isReadySubmit) {
            return PrimaryAppButton(
              isDisable: !isReadySubmit,
              text: localization.translate(
                LanguageKey.onBoardingSignupFormScreenSignup,
              ),
              onPress: _onSignup,
            );
          },
        ),
      ],
    );
  }

  @override
  Widget wrapBuild(BuildContext context, Widget child, AppTheme appTheme,
      AppLocalizationManager localization) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocListener<SignUpFormBloc, SignUpFormState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: _listenStatusChange,
        child: Scaffold(
          appBar: AppBarStepWidget(
            appTheme: appTheme,
          ),
          body: child,
        ),
      ),
    );
  }

  void _listenStatusChange(BuildContext context, SignUpFormState state) {
    switch (state.status) {
      case SignUpFormStatus.none:
        break;
      case SignUpFormStatus.loading:
        showLoading();
        break;
      case SignUpFormStatus.success:
        hideLoading();
        AppNavigator.push(
          RoutePath.otpCodeVerification,
          state.email,
        );
        break;
      case SignUpFormStatus.failed:
        hideLoading();

        showToast(state.error ?? '');
        break;
    }
  }
}
