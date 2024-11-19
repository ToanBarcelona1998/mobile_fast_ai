import 'base_remote_request.dart';

final class RemoveBackgroundRequest extends BaseRemoteRequest {
  final String image;

  const RemoveBackgroundRequest({
    required this.image,
    required super.accessToken,
  });
}
