import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_personal_info_state.freezed.dart';

enum SignUpPersonalInfoStatus {
  none,
  loading,
  uploaded,
  success,
  failed,
}

@freezed
class SignUpPersonalInfoState with _$SignUpPersonalInfoState {
  const factory SignUpPersonalInfoState({
    @Default(SignUpPersonalInfoStatus.none) SignUpPersonalInfoStatus status,
    String ?error,
    @Default(false) bool isReadySubmit,
    @Default('') String userName,
    String ?address,
    String ?birthday,
    @Default(0) int gender,
    String ?avatar,
    String ?phoneNumber,
  }) = _SignUpPersonalInfoState;
}
