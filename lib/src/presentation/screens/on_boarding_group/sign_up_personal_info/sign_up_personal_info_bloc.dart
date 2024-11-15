import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_fast_ai/src/cores/utils/dart_core_extension.dart';
import 'package:mobile_fast_ai/src/cores/utils/validator.dart';
import 'sign_up_personal_info_event.dart';
import 'sign_up_personal_info_state.dart';

final class SignUpPersonalInfoBloc
    extends Bloc<SignUpPersonalInfoEvent, SignUpPersonalInfoState> {
  final AuthUseCase _authUseCase;
  final UploadUseCase _uploadUseCase;

  SignUpPersonalInfoBloc(this._authUseCase, this._uploadUseCase)
      : super(
          const SignUpPersonalInfoState(),
        ) {
    on(_onUserNameChange);
    on(_onPhoneNumberChange);
    on(_onAddressChange);
    on(_onGenderChange);
    on(_onBirthdayChange);
    on(_onPickFile);
    on(_onSubmit);
  }

  bool validate(
    String userName,
    String? phoneNumber,
    String? birthday,
  ) {
    bool validForm = false;
    if (phoneNumber.isNotNullOrEmpty) {
      validForm = phoneNumber!.validatePhoneNumber();
    }

    if (birthday.isNotNullOrEmpty) {}
    return userName.isNotEmpty && validForm;
  }

  void _onUserNameChange(
    SignUpPersonalInfoEventOnUserNameChange event,
    Emitter<SignUpPersonalInfoState> emit,
  ) {
    emit(
      state.copyWith(
        userName: event.userName,
        isReadySubmit: validate(
          event.userName,
          state.phoneNumber,
          state.birthday,
        ),
      ),
    );
  }

  void _onPhoneNumberChange(
    SignUpPersonalInfoEventOnPhoneNumberChange event,
    Emitter<SignUpPersonalInfoState> emit,
  ) {
    emit(
      state.copyWith(
        phoneNumber: event.phoneNumber,
        isReadySubmit: validate(
          state.userName,
          event.phoneNumber,
          state.birthday,
        ),
      ),
    );
  }

  void _onAddressChange(
    SignUpPersonalInfoEventOnAddressChange event,
    Emitter<SignUpPersonalInfoState> emit,
  ) {
    emit(
      state.copyWith(
        address: event.address,
      ),
    );
  }

  void _onGenderChange(
    SignUpPersonalInfoEventOnGenderChange event,
    Emitter<SignUpPersonalInfoState> emit,
  ) {
    emit(
      state.copyWith(
        gender: event.gender,
      ),
    );
  }

  void _onBirthdayChange(
    SignUpPersonalInfoEventOnBirthdayChange event,
    Emitter<SignUpPersonalInfoState> emit,
  ) {
    emit(
      state.copyWith(
        birthday: event.birthday,
        isReadySubmit: validate(
          state.userName,
          state.phoneNumber,
          event.birthday,
        ),
      ),
    );
  }

  void _onPickFile(
    SignUpPersonalInfoEventOnPickImage event,
    Emitter<SignUpPersonalInfoState> emit,
  ) async {
    emit(
      state.copyWith(
        avatar: event.filePath,
      ),
    );
  }

  void _onSubmit(
    SignUpPersonalInfoEventOnSubmit event,
    Emitter<SignUpPersonalInfoState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: SignUpPersonalInfoStatus.loading,
        ),
      );

      String? avatar;

      if (state.avatar.isNotNullOrEmpty) {
        final uploaded = await _uploadUseCase.upload(state.avatar!);

        avatar = uploaded.url;
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: SignUpPersonalInfoStatus.failed,
          error: e.toString(),
        ),
      );
    }
  }

  static SignUpPersonalInfoBloc of(BuildContext context) =>
      BlocProvider.of<SignUpPersonalInfoBloc>(context);
}
