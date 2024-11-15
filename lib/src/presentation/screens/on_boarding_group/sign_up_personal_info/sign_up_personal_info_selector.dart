import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_up_personal_info_bloc.dart';
import 'sign_up_personal_info_state.dart';
import 'package:flutter/material.dart';

final class SignUpPersonalInfoReadySubmitSelector extends BlocSelector<
    SignUpPersonalInfoBloc, SignUpPersonalInfoState, bool> {
  SignUpPersonalInfoReadySubmitSelector({
    super.key,
    required Widget Function(bool) builder,
  }) : super(
          builder: (context, isReadySubmit) => builder(
            isReadySubmit,
          ),
          selector: (state) => state.isReadySubmit,
        );
}

final class SignUpPersonalInfoGenderSelector extends BlocSelector<
    SignUpPersonalInfoBloc, SignUpPersonalInfoState, int> {
  SignUpPersonalInfoGenderSelector({
    super.key,
    required Widget Function(int) builder,
  }) : super(
    builder: (context, gender) => builder(
      gender,
    ),
    selector: (state) => state.gender,
  );
}
