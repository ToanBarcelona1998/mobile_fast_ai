import 'base_remote_request.dart';

final class ControlNetRequest extends BaseRemoteRequest {
  final String image;
  final int? width;
  final int? height;
  final String? type;

  const ControlNetRequest({
    required this.image,
    this.width,
    this.height,
    this.type,
    required super.accessToken,
  });
}
