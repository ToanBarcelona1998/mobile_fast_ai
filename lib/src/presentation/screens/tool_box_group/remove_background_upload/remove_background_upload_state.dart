import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'remove_background_upload_state.freezed.dart';

enum RemoveBackgroundUploadStatus {
  none,
  removing,
  removed,
  failed,
}

extension RemoveBackgroundUploadStateE on RemoveBackgroundUploadState {
  RemoveBackgroundUploadState copyWithFile(File? file) {
    return RemoveBackgroundUploadState(
      image: file,
      error: error,
      status: status,
    );
  }
}

@freezed
class RemoveBackgroundUploadState with _$RemoveBackgroundUploadState {
  const factory RemoveBackgroundUploadState({
    @Default(RemoveBackgroundUploadStatus.none)
    RemoveBackgroundUploadStatus status,
    File? image,
    String? error,
  }) = _RemoveBackgroundUploadState;
}
