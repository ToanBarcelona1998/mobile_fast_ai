import 'dart:io';

import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_to_prompt_upload_state.freezed.dart';

enum ImageToPromptUploadStatus {
  none,
  generating,
  generated,
  failed,
}

extension ImageToPromptUploadStateE on ImageToPromptUploadState{
  ImageToPromptUploadState copyWithFile(File ?file){
    return ImageToPromptUploadState(
      status: status,
      file: file,
    );
  }
}

@freezed
class ImageToPromptUploadState with _$ImageToPromptUploadState {
  const factory ImageToPromptUploadState({
    @Default(ImageToPromptUploadStatus.none) ImageToPromptUploadStatus status,
    String ?error,
    @Default([]) List<AITask> tasks,
    File ?file,
  }) = _ImageToPromptUploadState;
}
