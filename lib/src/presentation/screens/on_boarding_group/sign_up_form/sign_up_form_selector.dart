import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_up_form_bloc.dart';
import 'sign_up_form_state.dart';

final class SignUpFormStatusSelector
    extends BlocSelector<SignUpFormBloc, SignUpFormState, SignUpFormStatus> {
  SignUpFormStatusSelector({
    super.key,
    required Widget Function(SignUpFormStatus) builder,
  }) : super(
          selector: (state) => state.status,
          builder: (context, status) => builder(status),
        );
}

final class SignUpFormHidePasswordSelector
    extends BlocSelector<SignUpFormBloc, SignUpFormState, bool> {
  SignUpFormHidePasswordSelector({
    super.key,
    required Widget Function(bool) builder,
  }) : super(
    selector: (state) => state.hidePassword,
    builder: (context, hidePassword) => builder(hidePassword),
  );
}

final class SignUpFormIsReadySubmitSelector
    extends BlocSelector<SignUpFormBloc, SignUpFormState, bool> {
  SignUpFormIsReadySubmitSelector({
    super.key,
    required Widget Function(bool) builder,
  }) : super(
    selector: (state) => state.isReadySubmit,
    builder: (context, isReadySubmit) => builder(isReadySubmit),
  );
}
