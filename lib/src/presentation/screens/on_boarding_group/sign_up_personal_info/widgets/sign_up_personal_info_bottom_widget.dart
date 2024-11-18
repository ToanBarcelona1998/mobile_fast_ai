import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_personal_info/sign_up_personal_info_bloc.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_personal_info/sign_up_personal_info_event.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/sign_up_personal_info/sign_up_personal_info_selector.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:flutter/material.dart';

class SignupPersonalInfoBottomWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;

  const SignupPersonalInfoBottomWidget({
    required this.appTheme,
    required this.localization,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HoLiZonTalDividerWidget(
          appTheme: appTheme,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Spacing.spacing07,
          ),
          child: SignUpPersonalInfoReadySubmitSelector(
            builder: (isReadySubmit) {
              return PrimaryAppButton(
                isDisable: !isReadySubmit,
                text: localization.translate(
                  LanguageKey.onBoardingSignupPersonalInfoScreenCreate,
                ),
                onPress: () => _onCreate(context),
              );
            }
          ),
        ),
      ],
    );
  }

  void _onCreate(BuildContext context) {
    SignUpPersonalInfoBloc.of(context).add(
      const SignUpPersonalInfoEventOnSubmit(),
    );
  }
}
