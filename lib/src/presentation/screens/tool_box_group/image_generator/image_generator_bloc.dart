import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_fast_ai/src/cores/utils/dart_core_extension.dart';
import 'package:mobile_fast_ai/src/cores/utils/image_generator_extension.dart';
import 'package:mobile_fast_ai/src/cores/utils/image_ratio.dart';
import 'package:mobile_fast_ai/src/cores/utils/validator.dart';
import 'image_generator_event.dart';

import 'image_generator_state.dart';

final class ImageGeneratorBloc
    extends Bloc<ImageGeneratorEvent, ImageGeneratorState> {
  final GeneratorUseCase _generatorUseCase;
  final ModelUseCase _modelUseCase;

  ImageGeneratorBloc(this._generatorUseCase, this._modelUseCase)
      : super(
          const ImageGeneratorState(),
        ) {
    on(_onInit);
    on(_onPromptChange);
    on(_onNegativePromptChange);
    on(_onCFGScaleChange);
    on(_onSelectedModel);
    on(_onRatioChange);
    on(_onSubmit);
  }

  bool _validate(
    String prompt,
    String? negativePrompt,
    Model? selectedModel,
  ) {
    bool status = true;

    if (negativePrompt.isNotNullOrEmpty) {
      status = negativePrompt!.validatePrompt();
    }

    return prompt.validatePrompt() && selectedModel != null && status;
  }

  void _onInit(
    ImageGeneratorEventOnInit event,
    Emitter<ImageGeneratorState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          screenStatus: ImageGeneratorScreenStatus.loading,
        ),
      );

      final models = await _modelUseCase.getAll();

      emit(
        state.copyWith(
          models: models,
          screenStatus: ImageGeneratorScreenStatus.loaded,
        ),
      );
    } catch (e) {
      LogProvider.log('Image generator init error ${e.toString()}');
      emit(
        state.copyWith(
          error: e.toString(),
          screenStatus: ImageGeneratorScreenStatus.error,
        ),
      );
    }
  }

  void _onPromptChange(
    ImageGeneratorEventOnChangePrompt event,
    Emitter<ImageGeneratorState> emit,
  ) {
    emit(
      state.copyWith(
        prompt: event.prompt,
        isReadySubmit: _validate(
          event.prompt,
          state.negativePrompt,
          state.selectedModel,
        ),
      ),
    );
  }

  void _onNegativePromptChange(
    ImageGeneratorEventOnChangeNegativePrompt event,
    Emitter<ImageGeneratorState> emit,
  ) {
    emit(
      state.copyWith(
        negativePrompt: event.prompt,
        isReadySubmit: _validate(
          state.prompt,
          event.prompt,
          state.selectedModel,
        ),
      ),
    );
  }

  void _onCFGScaleChange(
    ImageGeneratorEventOnCFGScaleChange event,
    Emitter<ImageGeneratorState> emit,
  ) {
    emit(
      state.copyWith(
        cfgScale: event.scfScale,
      ),
    );
  }

  void _onSelectedModel(
    ImageGeneratorEventOnSelectModel event,
    Emitter<ImageGeneratorState> emit,
  ) {

    final selectedModel = state.models.firstWhereOrNull(
          (e) => e.id == event.modelId,
    );

    emit(
      state.copyWith(
        selectedModel: selectedModel,
        isReadySubmit: _validate(
          state.prompt,
          state.negativePrompt,
          selectedModel,
        ),
      ),
    );
  }

  void _onRatioChange(
    ImageGeneratorEventOnChangeRatio event,
    Emitter<ImageGeneratorState> emit,
  ) {
    emit(
      state.copyWith(
        ratio: event.ratio,
      ),
    );
  }

  void _onSubmit(
    ImageGeneratorEventOnSubmit event,
    Emitter<ImageGeneratorState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: ImageGeneratorStatus.generating,
        ),
      );

      final tasks = await _generatorUseCase.generatesImage(
        model: state.selectedModel!.model,
        prompt: state.prompt,
        negativePrompt: state.negativePrompt,
        cfgScale: state.cfgScale.parseCFG(),
        width: state.ratio.fromRatio().width,
        height: state.ratio.fromRatio().height,
      );

      emit(
        state.copyWith(
          status: ImageGeneratorStatus.generated,
          completedTasks: tasks,
        ),
      );
    } catch (e) {
      LogProvider.log('Image generator generate error ${e.toString()}');
      emit(
        state.copyWith(
          status: ImageGeneratorStatus.failed,
          error: e.toString(),
        ),
      );
    }
  }

  static ImageGeneratorBloc of(BuildContext context) =>
      BlocProvider.of<ImageGeneratorBloc>(context);
}
