sealed class APIService{
  static const String _auth = '/auth';
  static const String login = '$_auth/login';
  static const String register = '$_auth/register';
  static const String registerVerifyEmail = '$register/verify-email';
  static const String refreshToken = '$_auth/refresh-token';

  static const String _user = '/user';
  static const String getUser = _user;
  static const String updateUser = _user;

  static const String _upload = '/upload';
  static const String upload = _upload;
}