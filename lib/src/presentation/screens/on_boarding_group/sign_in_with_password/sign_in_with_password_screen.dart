import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_fast_ai/config/di.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/base_screen.dart';
import 'sign_in_with_password_event.dart';
import 'sign_in_with_password_state.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'sign_in_with_password_bloc.dart';
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

class _SignInWithPasswordScreenState extends State<SignInWithPasswordScreen> with StateFulBaseScreen{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final SignInWithPasswordBloc _bloc = getIt.get<SignInWithPasswordBloc>();

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

  void _onSignIn() {
    _bloc.add(
      const SignInWithPasswordEventOnSubmit(),
    );
  }

  void _onEmailChange(){

  }

  @override
  Widget child(BuildContext context, AppTheme appTheme, AppLocalizationManager localization) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
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
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        PrimaryAppButton(
          text: localization.translate(
            LanguageKey
                .onBoardingSignInWithPasswordScreenSignIn,
          ),
          onPress: _onSignIn,
        ),
      ],
    );
  }

  @override
  Widget wrapBuild(BuildContext context, Widget child, AppTheme appTheme, AppLocalizationManager localization) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocListener<SignInWithPasswordBloc,SignInWithPasswordState>(
        listener: (context, state) {
          switch(state.status){
            case SignInWithPasswordStatus.none:
              break;
            case SignInWithPasswordStatus.loading:
              break;
            case SignInWithPasswordStatus.failed:
              break;
            case SignInWithPasswordStatus.success:
              break;
          }
        },
        child: Scaffold(
          backgroundColor: appTheme.bodyBackGroundColor,
          appBar: NormalAppBar(
            appTheme: appTheme,
          ),
          body: child,
        ),
      ),
    );
  }
}
