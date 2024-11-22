import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_fast_ai/src/cores/utils/validator.dart';
import 'enhance_prompt_input_event.dart';
import 'enhance_prompt_input_state.dart';

final class EnhancePromptInputBloc
    extends Bloc<EnhancePromptInputEvent, EnhancePromptInputState> {
  final GeneratorUseCase _generatorUseCase;

  EnhancePromptInputBloc(this._generatorUseCase)
      : super(
          const EnhancePromptInputState(),
        ){
    on(_onChangePrompt);
    on(_onSubmit);
  }

  void _onChangePrompt(
    EnhancePromptInputEventOnChangePrompt event,
    Emitter<EnhancePromptInputState> emit,
  ) {
    emit(
      state.copyWith(
        prompt: event.prompt,
        isReadySubmit: event.prompt.validatePrompt(),
      ),
    );
  }

  void _onSubmit(
    EnhancePromptInputEventOnSubmit event,
    Emitter<EnhancePromptInputState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          status: EnhancePromptInputStatus.generating,
        ),
      );

      final tasks = await _generatorUseCase.enhancePrompt(
        prompt: state.prompt,
        maxLength: 64,
      );

      emit(
        state.copyWith(
          tasks: tasks,
          status: EnhancePromptInputStatus.generated,
        ),
      );
    } catch (e) {
      LogProvider.log('Enhance prompt error ${e.toString()}');

      emit(
        state.copyWith(
          status: EnhancePromptInputStatus.failed,
          error: e.toString(),
        ),
      );
    }
  }

  static EnhancePromptInputBloc of(BuildContext context) => BlocProvider.of<EnhancePromptInputBloc>(context);
}
