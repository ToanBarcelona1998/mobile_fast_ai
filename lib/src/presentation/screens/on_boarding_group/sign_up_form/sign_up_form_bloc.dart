import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_fast_ai/src/cores/utils/dart_core_extension.dart';
import 'package:mobile_fast_ai/src/cores/utils/validator.dart';
import 'sign_up_form_event.dart';
import 'sign_up_form_state.dart';

final class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  final AuthUseCase _authUseCase;

  SignUpFormBloc(this._authUseCase)
      : super(
          const SignUpFormState(),
        ) {
    on(_onChangeEmail);
    on(_onChangePassword);
    on(_onChangeHidePassword);
    on(_onSubmit);
  }

  bool _isValidForm(String email, String password) {
    return email.validateEmail() && password.isNotNullOrEmpty;
  }

  void _onChangeEmail(
      SignUpFormOnChangeEmailEvent event, Emitter<SignUpFormState> emit) {
    emit(
      state.copyWith(
        email: event.email,
        isReadySubmit: _isValidForm(event.email, state.password),
      ),
    );
  }

  void _onChangePassword(
      SignUpFormOnChangePasswordEvent event, Emitter<SignUpFormState> emit) {
    emit(
      state.copyWith(
        password: event.password,
        isReadySubmit: _isValidForm(state.email, event.password),
      ),
    );
  }

  void _onChangeHidePassword(SignUpFormOnChangeHidePasswordEvent event,
      Emitter<SignUpFormState> emit) {
    emit(
      state.copyWith(
        hidePassword: !state.hidePassword,
      ),
    );
  }

  void _onSubmit(
      SignUpFormOnSubmitEvent event, Emitter<SignUpFormState> emit) async {
    try {
      emit(
        state.copyWith(
          status: SignUpFormStatus.loading,
        ),
      );

      await _authUseCase.register(state.email, state.password);

      emit(
        state.copyWith(
          status: SignUpFormStatus.success,
        ),
      );
    } catch (e) {
      LogProvider.log('Sign up form bloc: ${e.toString()}');
      emit(
        state.copyWith(
          error: e.toString(),
          status: SignUpFormStatus.failed,
        ),
      );
    }
  }

  static SignUpFormBloc of(BuildContext context) =>
      BlocProvider.of<SignUpFormBloc>(context);
}
