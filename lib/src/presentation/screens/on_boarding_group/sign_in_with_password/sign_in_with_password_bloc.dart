import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_fast_ai/src/cores/constants/error.dart';
import 'package:mobile_fast_ai/src/cores/utils/validator.dart';
import 'sign_in_with_password_event.dart';
import 'sign_in_with_password_state.dart';

final class SignInWithPasswordBloc
    extends Bloc<SignInWithPasswordEvent, SignInWithPasswordState> {
  final AuthUseCase _authUseCase;

  SignInWithPasswordBloc(this._authUseCase)
      : super(
          const SignInWithPasswordState(),
        ) {
    on(_onPasswordChange);
    on(_onUserNameChange);
    on(_onHidePasswordChange);
    on(_onSubmit);
  }

  bool _validateForm(String email, String password) {
    return email.validateEmail() && password.isNotEmpty;
  }

  void _onPasswordChange(
    SignInWithPasswordEventOnPasswordChange event,
    Emitter<SignInWithPasswordState> emit,
  ) {
    emit(
      state.copyWith(
        password: event.password,
        isReadySubmit: _validateForm(
          state.userName,
          event.password,
        ),
      ),
    );
  }

  void _onUserNameChange(
    SignInWithPasswordEventOnUserNameChange event,
    Emitter<SignInWithPasswordState> emit,
  ) {
    emit(
      state.copyWith(
        userName: event.userName,
        isReadySubmit: _validateForm(
          event.userName,
          state.password,
        ),
      ),
    );
  }

  void _onHidePasswordChange(
      SignInWithPasswordEventOnHidePasswordChange event,
      Emitter<SignInWithPasswordState> emit,
      ) {
    emit(
      state.copyWith(
        hidePassword: !state.hidePassword,
      ),
    );
  }

  void _onSubmit(
    SignInWithPasswordEventOnSubmit event,
    Emitter<SignInWithPasswordState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: SignInWithPasswordStatus.loading,
        ),
      );
      await _authUseCase.login(state.userName, state.password);

      emit(
        state.copyWith(
          status: SignInWithPasswordStatus.success,
        ),
      );
    } catch (e) {
      SignInWithPasswordStatus status = SignInWithPasswordStatus.failed;

      if (e is FastAIError) {
        final code = e.code;

        if (code == userMissingOnBoardingError) {
          status = SignInWithPasswordStatus.userMissingOnboardingFlow;
        }

        if(code == userMissingVerificationEmailError){
          status = SignInWithPasswordStatus.userMissingOtpFlow;
        }
      }

      emit(
        state.copyWith(
          errorMsg: e.toString(),
          status: status,
        ),
      );
    }
  }

  static SignInWithPasswordBloc of(BuildContext context) => BlocProvider.of<SignInWithPasswordBloc>(context);
}
