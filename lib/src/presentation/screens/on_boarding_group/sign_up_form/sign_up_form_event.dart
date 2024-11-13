import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_form_event.freezed.dart';

@freezed
class SignUpFormEvent with _$SignUpFormEvent{
  const factory SignUpFormEvent.onChangeEmail(String email) = SignUpFormOnChangeEmailEvent;
  const factory SignUpFormEvent.onChangePassword(String password) = SignUpFormOnChangePasswordEvent;
  const factory SignUpFormEvent.onChangeHidePassword() = SignUpFormOnChangeHidePasswordEvent;
  const factory SignUpFormEvent.onSubmit() = SignUpFormOnSubmitEvent;
}