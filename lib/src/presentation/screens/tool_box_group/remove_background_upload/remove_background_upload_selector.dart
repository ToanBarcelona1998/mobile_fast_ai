import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'remove_background_bloc.dart';
import 'remove_background_upload_state.dart';
import 'package:flutter/material.dart';

final class RemoveBackgroundUploadFileSelector extends BlocSelector<
    RemoveBackgroundUploadBloc, RemoveBackgroundUploadState, File?> {
  RemoveBackgroundUploadFileSelector({
    super.key,
    required Widget Function(File?) builder,
  }) : super(
          selector: (state) => state.image,
          builder: (context, file) => builder(file),
        );
}
