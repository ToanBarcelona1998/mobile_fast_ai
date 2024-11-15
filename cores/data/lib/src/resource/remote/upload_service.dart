import 'dart:io';

import 'package:data/core/base_response.dart';

abstract class UploadService {
  Future<BaseResponse> upload(
    String accessToken,
    File file,
  );
}
