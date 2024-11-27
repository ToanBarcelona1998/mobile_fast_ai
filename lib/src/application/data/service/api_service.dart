sealed class APIService{
  static const String _auth = '/auth';
  static const String login = '$_auth/login';
  static const String register = '$_auth/register';
  static const String registerVerifyEmail = '$register/verify-email';
  static const String refreshToken = '$_auth/refresh-token';
  static const String registerCompleteProfile = '$register/complete-profile';

  static const String _user = '/user';
  static const String getUser = _user;
  static const String updateUser = _user;

  static const String _upload = '/upload';
  static const String upload = _upload;

  static const String _imageGenerator = '/image-generator';
  static const String generateImages = '$_imageGenerator/generate-images';
  static const String removeBackground = '$_imageGenerator/remove-background';
  static const String upscale = '$_imageGenerator/upscale';
  static const String controlNet = '$_imageGenerator/control-net';
  static const String imageToText = '$_imageGenerator/image-to-text';
  static const String enhancePrompt = '$_imageGenerator/enhance-prompt';


  static const String _model = '/model';
  static const String getAllModel = '$_model/get-all';

  static const String _transaction = '/transaction';
  static const String createTransaction = '$_transaction/create-transaction';
  static const String completeTransaction = '$_transaction/complete-transaction';
}