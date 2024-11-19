import 'base_remote_request.dart';

final class ImageToTextRequest extends BaseRemoteRequest {
  final String image;

  const ImageToTextRequest({
    required this.image,
    required super.accessToken,
  });
}
