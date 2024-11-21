import 'dart:io';

import 'base_remote_request.dart';

final class RemoveBackgroundRequest extends BaseRemoteRequest {
  final File image;

  const RemoveBackgroundRequest({
    required this.image,
    required super.accessToken,
  });
}
