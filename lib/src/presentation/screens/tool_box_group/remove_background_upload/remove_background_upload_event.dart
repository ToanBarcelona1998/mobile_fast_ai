import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'remove_background_upload_event.freezed.dart';

@freezed
class RemoveBackgroundUploadEvent with _$RemoveBackgroundUploadEvent{
  const factory RemoveBackgroundUploadEvent.onSubmit() = RemoveBackgroundUploadEventOnSubmit;
  const factory RemoveBackgroundUploadEvent.onPickFile(File file) = RemoveBackgroundUploadEventOnPickFile;
  const factory RemoveBackgroundUploadEvent.onRemoveFile() = RemoveBackgroundUploadEventOnRemoveFile;
}