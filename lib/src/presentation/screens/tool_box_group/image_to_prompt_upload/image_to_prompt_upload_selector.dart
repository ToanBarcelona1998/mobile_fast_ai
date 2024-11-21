import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'image_to_prompt_upload_bloc.dart';
import 'image_to_prompt_upload_state.dart';

import 'package:flutter/material.dart';

final class ImageToPromptUploadFileSelector extends BlocSelector<
    ImageToPromptUploadBloc, ImageToPromptUploadState, File?> {
  ImageToPromptUploadFileSelector({
    super.key,
    required Widget Function(File?) builder,
  }) : super(
          selector: (state) => state.file,
          builder: (context, file) => builder(
            file,
          ),
        );
}
