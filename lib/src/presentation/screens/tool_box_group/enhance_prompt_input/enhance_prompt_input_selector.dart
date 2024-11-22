import 'package:flutter_bloc/flutter_bloc.dart';
import 'enhance_prompt_input_bloc.dart';
import 'enhance_prompt_input_state.dart';

import 'package:flutter/material.dart';

final class EnhancePromptInputIsReadySubmitSelector extends BlocSelector<
    EnhancePromptInputBloc, EnhancePromptInputState, bool> {
  EnhancePromptInputIsReadySubmitSelector({
    super.key,
    required Widget Function(bool) builder,
  }) : super(
          selector: (state) => state.isReadySubmit,
          builder: (context, isReadySubmit) => builder(isReadySubmit),
        );
}
