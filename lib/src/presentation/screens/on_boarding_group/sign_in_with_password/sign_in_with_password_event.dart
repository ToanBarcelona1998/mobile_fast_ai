import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_with_password_event.freezed.dart';

@freezed
class SignInWithPasswordEvent with _$SignInWithPasswordEvent {
  const factory SignInWithPasswordEvent.onUserNameChange(
    String userName,
  ) = SignInWithPasswordEventOnUserNameChange;

  const factory SignInWithPasswordEvent.onPasswordChange(
    String password,
  ) = SignInWithPasswordEventOnPasswordChange;

  const factory SignInWithPasswordEvent.onHidePasswordChange() =
      SignInWithPasswordEventOnHidePasswordChange;

  const factory SignInWithPasswordEvent.onSubmit() =
      SignInWithPasswordEventOnSubmit;
}
