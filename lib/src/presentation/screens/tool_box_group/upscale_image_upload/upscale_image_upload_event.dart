import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'upscale_image_upload_event.freezed.dart';

@freezed
class UpscaleImageUploadEvent with _$UpscaleImageUploadEvent{
  const factory UpscaleImageUploadEvent.onSubmit() = UpscaleImageUploadEventOnSubmit;
  const factory UpscaleImageUploadEvent.onPickFile(File file) = UpscaleImageUploadEventOnPickFile;
  const factory UpscaleImageUploadEvent.onRemoveFile() = UpscaleImageUploadEventOnRemoveFile;
  const factory UpscaleImageUploadEvent.onChangeScaleFactor(int scaleFactor) = UpscaleImageUploadEventOnChangeScaleFactor;
}