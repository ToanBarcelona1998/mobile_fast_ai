final class RegisterResponse {
  final String accessToken;

  const RegisterResponse({
    required this.accessToken,
  });

  factory RegisterResponse.fromJson(Map<String,dynamic> json) {
    return RegisterResponse(
      accessToken: json['access_token'],
    );
  }
}
