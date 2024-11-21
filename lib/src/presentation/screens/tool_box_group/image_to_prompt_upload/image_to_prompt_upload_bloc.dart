import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'image_to_prompt_upload_event.dart';
import 'image_to_prompt_upload_state.dart';

final class ImageToPromptUploadBloc
    extends Bloc<ImageToPromptUploadEvent, ImageToPromptUploadState> {
  final GeneratorUseCase _generatorUseCase;

  ImageToPromptUploadBloc(this._generatorUseCase)
      : super(
          const ImageToPromptUploadState(),
        ) {
    on(_onPickFile);
    on(_onRemoveFile);
    on(_onSubmit);
  }

  void _onPickFile(
    ImageToPromptUploadEventOnPickFile event,
    Emitter<ImageToPromptUploadState> emit,
  ) {
    emit(
      state.copyWith(
        file: event.file,
      ),
    );
  }

  void _onRemoveFile(
    ImageToPromptUploadEventOnRemoveFile event,
    Emitter<ImageToPromptUploadState> emit,
  ) {
    emit(
      state.copyWithFile(
        null,
      ),
    );
  }

  void _onSubmit(
    ImageToPromptUploadEventOnSubmit event,
    Emitter<ImageToPromptUploadState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: ImageToPromptUploadStatus.generating,
        ),
      );

      final tasks = await _generatorUseCase.imageToText(
        image: state.file!,
      );

      emit(
        state.copyWith(
          status: ImageToPromptUploadStatus.generated,
          tasks: tasks,
        ),
      );
    } catch (e) {
      LogProvider.log('Image to prompt error ${e.toString()}');

      emit(
        state.copyWith(
          error: e.toString(),
          status: ImageToPromptUploadStatus.failed,
        ),
      );
    }
  }

  static ImageToPromptUploadBloc of(BuildContext context) => BlocProvider.of<ImageToPromptUploadBloc>(context);
}
