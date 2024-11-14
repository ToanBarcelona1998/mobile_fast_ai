import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_code_verification_event.freezed.dart';

@freezed
class OtpCodeVerificationEvent with _$OtpCodeVerificationEvent{
  const factory OtpCodeVerificationEvent.onChangeOtp(String otp) = OtpCodeVerificationOnChangeCodeEvent;
  const factory OtpCodeVerificationEvent.onDeleteOtp() = OtpCodeVerificationOnDeleteEvent;
  const factory OtpCodeVerificationEvent.onSubmit() = OtpCodeVerificationOnSubmitEvent;
  const factory OtpCodeVerificationEvent.onResend() = OtpCodeVerificationOnResendEvent;
}