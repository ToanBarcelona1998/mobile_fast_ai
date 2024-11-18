import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_fast_ai/config/di.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/flutter_toast.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_personal_info/widgets/sign_up_personal_info_bottom_widget.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_personal_info/widgets/sign_up_personal_info_content_widget.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_personal_info/widgets/sign_up_personal_info_input_form_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/base_screen.dart';

import 'sign_up_personal_info_bloc.dart';
import 'sign_up_personal_info_state.dart';

class SignupPersonalInfoScreen extends StatefulWidget {
  const SignupPersonalInfoScreen({super.key});

  @override
  State<SignupPersonalInfoScreen> createState() =>
      _SignupPersonalInfoScreenState();
}

class _SignupPersonalInfoScreenState extends State<SignupPersonalInfoScreen>
    with StateFulBaseScreen, CustomFlutterToast {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final SignUpPersonalInfoBloc _bloc = getIt.get<SignUpPersonalInfoBloc>();

  final List<String> _genders = List.empty(growable: true);

  @override
  void dispose() {
    _userNameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final AppLocalizationManager localizationManager =
        AppLocalizationManager.of(context);
    _genders.addAll([
      localizationManager.translate(
        LanguageKey.commonGenderMale,
      ),
      localizationManager.translate(
        LanguageKey.commonGenderFeMale,
      ),
      localizationManager.translate(
        LanguageKey.commonGenderOther,
      ),
    ]);
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
                SignupPersonalInfoContentWidget(
                  localization: localization,
                  appTheme: appTheme,
                ),
                SignupPersonalInfoInputFormWidget(
                  userNameController: _userNameController,
                  phoneNumberController: _phoneController,
                  addressController: _addressController,
                  appTheme: appTheme,
                  localization: localization,
                  genders: _genders,
                ),
              ],
            ),
          ),
        ),
        SignupPersonalInfoBottomWidget(
          appTheme: appTheme,
          localization: localization,
        ),
      ],
    );
  }

  @override
  Widget wrapBuild(BuildContext context, Widget child, AppTheme appTheme,
      AppLocalizationManager localization) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocListener<SignUpPersonalInfoBloc, SignUpPersonalInfoState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: _listenStateChange,
        child: Scaffold(
          appBar: AppBarStepWidget(
            appTheme: appTheme,
            currentStep: 2,
          ),
          body: child,
        ),
      ),
    );
  }

  void _listenStateChange(BuildContext context, SignUpPersonalInfoState state) {
    switch (state.status) {
      case SignUpPersonalInfoStatus.loading:
        showLoading();
        break;
      case SignUpPersonalInfoStatus.success:
        hideLoading();

        AppNavigator.push(RoutePath.home);
        break;
      case SignUpPersonalInfoStatus.failed:
        hideLoading();
        showToast(state.error ?? '');
        break;
      case SignUpPersonalInfoStatus.none:
        break;
    }
  }
}
