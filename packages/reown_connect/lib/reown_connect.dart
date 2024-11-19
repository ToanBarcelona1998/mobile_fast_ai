library reown_connect;

import 'package:flutter/material.dart';

abstract interface class ReownConnect {
  Future<void> init(
    String projectId, {
    required BuildContext context,
    required String appName,
    required String description,
    required String url,
    required String icon,
  });
}
