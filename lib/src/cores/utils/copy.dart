import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';

import 'flutter_toast.dart';

mixin Copy<T extends StatefulWidget> on CustomFlutterToast<T> {
  void copy(String value) async {
    await Clipboard.setData(
      ClipboardData(text: value),
    );

    if (Platform.isIOS) {
      if (mounted) {
        showToast(
          AppLocalizationManager.of(context).translate(
            LanguageKey.commonCopy,
          ),
        );
      }
    }
  }
}
