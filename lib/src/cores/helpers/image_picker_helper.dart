import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'system_permission_helper.dart';

sealed class ImagePickerHelper {
  static void _checkPermission({
    required VoidCallback onSuccessful,
    required VoidCallback onError,
  }) async {
    try {
      PermissionStatus status =
          await SystemPermissionHelper.getCurrentPhotoPermissionStatus();

      if (!status.isGranted) {
        SystemPermissionHelper.requestPhotoPermission(
          onSuccessFul: onSuccessful,
          reject: () {
            SystemPermissionHelper.goToSettings();
          },
        );
      } else {
        onSuccessful.call();
      }
    } catch (e) {
      SystemPermissionHelper.goToSettings();
      onError();
    }
  }

  static Future<String?> pickSingleImage([
    ImageSource imageSource = ImageSource.gallery,
  ]) async {
    final Completer<String?> completer = Completer();

    _checkPermission(
      onSuccessful: () async {
        final ImagePicker picker = ImagePicker();

        final XFile? xFile = await picker.pickImage(
          source: imageSource,
        );

        completer.complete(xFile?.path);
      },
      onError: () {
        completer.complete(null);
      },
    );

    return completer.future;
  }

  static Future<List<String>> pickMultiImage() async {
    final Completer<List<String>> completer = Completer();

    _checkPermission(
      onSuccessful: () async {
        final ImagePicker picker = ImagePicker();

        final List<XFile> xFiles = await picker.pickMultiImage();

        completer.complete(
          xFiles
              .map(
                (e) => e.path,
              )
              .toList(),
        );
      },
      onError: () {
        completer.complete(
          [],
        );
      },
    );

    return completer.future;
  }
}
