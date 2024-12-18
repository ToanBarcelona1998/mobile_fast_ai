import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_with_password_state.freezed.dart';

enum SignInWithPasswordStatus {
  none,
  loading,
  success,
  userMissingOtpFlow,
  userMissingOnboardingFlow,
  failed,
}

@freezed
class SignInWithPasswordState with _$SignInWithPasswordState {
  const factory SignInWithPasswordState({
    @Default(SignInWithPasswordStatus.none) SignInWithPasswordStatus status,
    String ?errorMsg,
    @Default(false) bool isReadySubmit,
    @Default(true) bool hidePassword,
    @Default('') String userName,
    @Default('') String password,
  }) = _SignInWithPasswordState;
}
