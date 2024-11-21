import 'dart:io';

import 'base_remote_request.dart';

final class UpScaleImageRequest extends BaseRemoteRequest {
  final File image;
  final int scaleFactor;

  const UpScaleImageRequest({
    required this.image,
    required this.scaleFactor,
    required super.accessToken,
  });
}
