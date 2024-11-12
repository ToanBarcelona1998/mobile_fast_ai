final class VerifyEmailRequest {
  final String otp;
  final String email;

  const VerifyEmailRequest({
    required this.otp,
    required this.email,
  });
}
