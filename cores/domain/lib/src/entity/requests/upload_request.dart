import 'dart:io';

final class UploadRequest {
  final String accessToken;
  final File file;

  const UploadRequest({
    required this.accessToken,
    required this.file,
  });
}
