import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'image_generator_bloc.dart';
import 'image_generator_state.dart';
import 'package:flutter/material.dart';

final class ImageGeneratorScreenStatusSelector extends BlocSelector<
    ImageGeneratorBloc, ImageGeneratorState, ImageGeneratorScreenStatus> {
  ImageGeneratorScreenStatusSelector({
    super.key,
    required Widget Function(ImageGeneratorScreenStatus) builder,
  }) : super(
          selector: (state) => state.screenStatus,
          builder: (context, screenStatus) => builder(screenStatus),
        );
}

final class ImageGeneratorCFGScaleSelector extends BlocSelector<
    ImageGeneratorBloc, ImageGeneratorState, double> {
  ImageGeneratorCFGScaleSelector({
    super.key,
    required Widget Function(double) builder,
  }) : super(
          selector: (state) => state.cfgScale,
          builder: (context, cfgScale) => builder(cfgScale),
        );
}

final class ImageGeneratorIsReadySubmitSelector extends BlocSelector<
    ImageGeneratorBloc, ImageGeneratorState, bool> {
  ImageGeneratorIsReadySubmitSelector({
    super.key,
    required Widget Function(bool) builder,
  }) : super(
          selector: (state) => state.isReadySubmit,
          builder: (context, isReadySubmit) => builder(isReadySubmit),
        );
}

final class ImageGeneratorRatioSelector extends BlocSelector<
    ImageGeneratorBloc, ImageGeneratorState, int> {
  ImageGeneratorRatioSelector({
    super.key,
    required Widget Function(int) builder,
  }) : super(
    selector: (state) => state.ratio,
    builder: (context, ratio) => builder(ratio),
  );
}

final class ImageGeneratorModelsSelector extends BlocSelector<
    ImageGeneratorBloc, ImageGeneratorState, List<Model>> {
  ImageGeneratorModelsSelector({
    super.key,
    required Widget Function(List<Model>) builder,
  }) : super(
    selector: (state) => state.models,
    builder: (context, models) => builder(models),
  );
}

final class ImageGeneratorSelectedModelSelector extends BlocSelector<
    ImageGeneratorBloc, ImageGeneratorState, Model?> {
  ImageGeneratorSelectedModelSelector({
    super.key,
    required Widget Function(Model?) builder,
  }) : super(
    selector: (state) => state.selectedModel,
    builder: (context, selectedModel) => builder(selectedModel),
  );
}
