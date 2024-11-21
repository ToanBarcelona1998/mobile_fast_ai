import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'upscale_image_upload_event.dart';
import 'upscale_image_upload_state.dart';

final class UpscaleImageUploadBloc
    extends Bloc<UpscaleImageUploadEvent, UpscaleImageUploadState> {
  final GeneratorUseCase _generatorUseCase;

  UpscaleImageUploadBloc(this._generatorUseCase)
      : super(
          const UpscaleImageUploadState(),
        ) {
    on(_onPickFile);
    on(_onRemoveFile);
    on(_onChangeScaleFactor);
    on(_onSubmit);
  }

  void _onPickFile(
    UpscaleImageUploadEventOnPickFile event,
    Emitter<UpscaleImageUploadState> emit,
  ) {
    emit(
      state.copyWith(
        image: event.file,
      ),
    );
  }

  void _onRemoveFile(
    UpscaleImageUploadEventOnRemoveFile event,
    Emitter<UpscaleImageUploadState> emit,
  ) {
    emit(
      state.copyWithFile(
        null,
      ),
    );
  }

  void _onChangeScaleFactor(
    UpscaleImageUploadEventOnChangeScaleFactor event,
    Emitter<UpscaleImageUploadState> emit,
  ) {
    emit(
      state.copyWith(
        scaleFactor: event.scaleFactor,
      ),
    );
  }

  void _onSubmit(
    UpscaleImageUploadEventOnSubmit event,
    Emitter<UpscaleImageUploadState> emit,
  ) async {
    try {
      emit(state.copyWith(
        status: UpscaleImageUploadStatus.upscaling,
      ));

      final tasks = await _generatorUseCase.upScaleImage(
        image: state.image!,
        scaleFactor: state.scaleFactor,
      );

      emit(state.copyWith(
        status: UpscaleImageUploadStatus.done,
        tasks: tasks,
      ));
    } catch (e) {
      LogProvider.log('Upscale image upload error ${e.toString()}');

      emit(state.copyWith(
        error: e.toString(),
        status: UpscaleImageUploadStatus.failed,
      ));
    }
  }

  static UpscaleImageUploadBloc of(BuildContext context) => BlocProvider.of<UpscaleImageUploadBloc>(context);
}
