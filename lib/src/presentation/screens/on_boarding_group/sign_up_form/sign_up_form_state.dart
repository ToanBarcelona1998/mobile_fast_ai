import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_form_state.freezed.dart';

enum SignUpFormStatus {
  none,
  loading,
  success,
  failed,
}

@freezed
class SignUpFormState with _$SignUpFormState {
  const factory SignUpFormState({
    @Default(SignUpFormStatus.none) SignUpFormStatus status,
    @Default(false) bool isReadySubmit,
    @Default('') String email,
    @Default('') String password,
    @Default(true) bool hidePassword,
    String? error,
  }) = _SignUpFormState;
}
