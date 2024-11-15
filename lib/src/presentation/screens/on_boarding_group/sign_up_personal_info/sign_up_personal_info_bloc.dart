import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_up_personal_info_event.dart';
import 'sign_up_personal_info_state.dart';

final class SignUpPersonalInfoBloc
    extends Bloc<SignUpPersonalInfoEvent, SignUpPersonalInfoState> {
  final AuthUseCase _authUseCase;

  SignUpPersonalInfoBloc(this._authUseCase)
      : super(
          const SignUpPersonalInfoState(),
        ){
    on(_onUserNameChange);
    on(_onPhoneNumberChange);
    on(_onAddressChange);
    on(_onGenderChange);
    on(_onBirthdayChange);
    on(_onUploadAvatar);
    on(_onSubmit);
  }

  void _onUserNameChange(
    SignUpPersonalInfoEventOnUserNameChange event,
    Emitter<SignUpPersonalInfoState> emit,
  ) {
    emit(
      state.copyWith(
        userName: event.userName,
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
      ),
    );
  }

  void _onUploadAvatar(
    SignUpPersonalInfoEventOnUploadAvatar event,
    Emitter<SignUpPersonalInfoState> emit,
  ) async {}

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
    } catch (e) {
      emit(
        state.copyWith(
          status: SignUpPersonalInfoStatus.failed,
          error: e.toString(),
        ),
      );
    }
  }
}
