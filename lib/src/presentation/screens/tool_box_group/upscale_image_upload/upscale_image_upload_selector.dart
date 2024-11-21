import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'upscale_image_upload_bloc.dart';
import 'upscale_image_upload_state.dart';

import 'package:flutter/material.dart';

final class UpscaleImageUploadScaleFactorSelector
    extends BlocSelector<UpscaleImageUploadBloc, UpscaleImageUploadState, int> {
  UpscaleImageUploadScaleFactorSelector({
    super.key,
    required Widget Function(int) builder,
  }) : super(
          selector: (state) => state.scaleFactor,
          builder: (context, scaleFactor) => builder(scaleFactor),
        );
}

final class UpscaleImageUploadFileSelector
    extends BlocSelector<UpscaleImageUploadBloc, UpscaleImageUploadState, File?> {
  UpscaleImageUploadFileSelector({
    super.key,
    required Widget Function(File?) builder,
  }) : super(
          selector: (state) => state.image,
          builder: (context, image) => builder(image),
        );
}
