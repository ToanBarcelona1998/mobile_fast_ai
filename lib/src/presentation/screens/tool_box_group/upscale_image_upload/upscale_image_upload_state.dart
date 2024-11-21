import 'dart:io';

import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upscale_image_upload_state.freezed.dart';

enum UpscaleImageUploadStatus {
  none,
  upscaling,
  done,
  failed,
}

extension UpscaleImageUploadStateE on UpscaleImageUploadState {
  UpscaleImageUploadState copyWithFile(File? file) {
    return UpscaleImageUploadState(
      image: file,
      status: status,
      scaleFactor: scaleFactor,
    );
  }
}

@freezed
class UpscaleImageUploadState with _$UpscaleImageUploadState {
  const factory UpscaleImageUploadState({
    @Default(UpscaleImageUploadStatus.none)
    UpscaleImageUploadStatus status,
    File? image,
    @Default(2) int scaleFactor,
    String? error,
    @Default([]) List<AITask> tasks,
  }) = _UpscaleImageUploadState;
}
