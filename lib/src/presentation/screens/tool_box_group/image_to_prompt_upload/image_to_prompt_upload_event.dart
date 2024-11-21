import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_to_prompt_upload_event.freezed.dart';

@freezed
class ImageToPromptUploadEvent with _$ImageToPromptUploadEvent{
  const factory ImageToPromptUploadEvent.onPickFile(File file) = ImageToPromptUploadEventOnPickFile;
  const factory ImageToPromptUploadEvent.onRemoveFile() = ImageToPromptUploadEventOnRemoveFile;
  const factory ImageToPromptUploadEvent.onSubmit() = ImageToPromptUploadEventOnSubmit;
}