import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_code_verification_state.freezed.dart';

enum OtpCodeVerificationStatus { none, checking, success, failed }

@freezed
class OtpCodeVerificationState with _$OtpCodeVerificationState {
  const factory OtpCodeVerificationState({
    @Default(OtpCodeVerificationStatus.none) OtpCodeVerificationStatus status,
    String ?error,
    required String email,
    @Default([]) List<String> codes,
    @Default(false) isReadySubmit,
  }) = _OtpCodeVerificationState;
}
