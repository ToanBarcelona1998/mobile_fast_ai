final class LoginResponse {
  final String accessToken;

  const LoginResponse({
    required this.accessToken,
  });

  factory LoginResponse.fromJson(Map<String,dynamic> json) {
    return LoginResponse(
      accessToken: json['access_token'],
    );
  }
}
