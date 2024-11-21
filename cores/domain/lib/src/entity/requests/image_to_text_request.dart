import 'dart:io';

import 'base_remote_request.dart';

final class ImageToTextRequest extends BaseRemoteRequest {
  final File image;

  const ImageToTextRequest({
    required this.image,
    required super.accessToken,
  });
}
