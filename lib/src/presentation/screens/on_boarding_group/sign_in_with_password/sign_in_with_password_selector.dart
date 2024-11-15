import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_in_with_password_bloc.dart';
import 'sign_in_with_password_state.dart';
import 'package:flutter/material.dart';

final class SignInWithPasswordIsReadySubmitSelector extends BlocSelector<
    SignInWithPasswordBloc, SignInWithPasswordState, bool> {
  SignInWithPasswordIsReadySubmitSelector({
    super.key,
    required Widget Function(bool) builder,
  }) : super(
          selector: (state) => state.isReadySubmit,
          builder: (context, isReadySubmit) => builder(isReadySubmit),
        );
}

final class SignInWithPasswordHidePasswordSelector extends BlocSelector<
    SignInWithPasswordBloc, SignInWithPasswordState, bool> {
  SignInWithPasswordHidePasswordSelector({
    super.key,
    required Widget Function(bool) builder,
  }) : super(
          selector: (state) => state.hidePassword,
          builder: (context, hidePassword) => builder(hidePassword),
        );
}
