import 'dart:convert';

import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'remove_background_upload_event.dart';
import 'remove_background_upload_state.dart';

final class RemoveBackgroundUploadBloc
    extends Bloc<RemoveBackgroundUploadEvent, RemoveBackgroundUploadState> {
  final GeneratorUseCase _generatorUseCase;

  RemoveBackgroundUploadBloc(this._generatorUseCase)
      : super(
          const RemoveBackgroundUploadState(),
        ) {
    on(_submit);
    on(_onRemoveFile);
    on(_onPickFile);
  }

  void _onPickFile(
    RemoveBackgroundUploadEventOnPickFile event,
    Emitter<RemoveBackgroundUploadState> emit,
  ) {
    emit(
      state.copyWith(
        image: event.file,
      ),
    );
  }

  void _onRemoveFile(
    RemoveBackgroundUploadEventOnRemoveFile event,
    Emitter<RemoveBackgroundUploadState> emit,
  ) {
    emit(
      state.copyWithFile(
        null,
      ),
    );
  }

  void _submit(
    RemoveBackgroundUploadEventOnSubmit event,
    Emitter<RemoveBackgroundUploadState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: RemoveBackgroundUploadStatus.removing,
        ),
      );

      final image = base64Encode(
        state.image!.readAsBytesSync(),
      );

      final List<AITask> tasks = await _generatorUseCase.removeBackground(
        image: image,
      );

      emit(state.copyWith(
        status: RemoveBackgroundUploadStatus.removed,
        tasks: tasks,
      ));
    } catch (e) {
      LogProvider.log('Remove background error ${e.toString()}');
      emit(
        state.copyWith(
          status: RemoveBackgroundUploadStatus.failed,
          error: e.toString(),
        ),
      );
    }
  }

  static RemoveBackgroundUploadBloc of(BuildContext context) => BlocProvider.of<RemoveBackgroundUploadBloc>(context);
}
