import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_fast_ai/config/di.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/flutter_toast.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_loading_widget.dart';
import 'image_generator_selector.dart';
import 'image_generator_bloc.dart';
import 'image_generator_event.dart';
import 'image_generator_state.dart';
import 'widgets/input_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/base_screen.dart';
import 'widgets/bottom_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/enter_prompt_widget.dart';
import 'widgets/aspect_ratio_widget.dart';
import 'widgets/model_widget.dart';

class ImageGeneratorScreen extends StatefulWidget {
  const ImageGeneratorScreen({super.key});

  @override
  State<ImageGeneratorScreen> createState() => _ImageGeneratorScreenState();
}

class _ImageGeneratorScreenState extends State<ImageGeneratorScreen>
    with StateFulBaseScreen, CustomFlutterToast {
  final TextEditingController _promptController = TextEditingController();
  final TextEditingController _negativePromptController =
      TextEditingController();

  final ImageGeneratorBloc _bloc = getIt.get<ImageGeneratorBloc>();

  @override
  void initState() {
    _bloc.add(
      const ImageGeneratorEventOnInit(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _promptController.dispose();
    _negativePromptController.dispose();
    super.dispose();
  }

  @override
  Widget child(BuildContext context, AppTheme appTheme,
      AppLocalizationManager localization) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ImageGeneratorEnterPromptWidget(
                  appTheme: appTheme,
                  localization: localization,
                  promptController: _promptController,
                  negativePromptController: _negativePromptController,
                ),
                const SizedBox(
                  height: BoxSize.boxSize05,
                ),
                ImageGeneratorAspectRatioWidget(
                  appTheme: appTheme,
                  localization: localization,
                ),
                const SizedBox(
                  height: BoxSize.boxSize05,
                ),
                ImageGeneratorInputWidget(
                  appTheme: appTheme,
                  localization: localization,
                  maxCFG: 30,
                  minCFG: 0,
                ),
                const SizedBox(
                  height: BoxSize.boxSize05,
                ),
                ImageGeneratorModelWidget(
                  localization: localization,
                  appTheme: appTheme,
                ),
                const SizedBox(
                  height: BoxSize.boxSize05,
                ),
              ],
            ),
          ),
        ),
        ImageGeneratorBottomWidget(
          appTheme: appTheme,
          localization: localization,
        ),
      ],
    );
  }

  @override
  Widget wrapBuild(BuildContext context, Widget child, AppTheme appTheme,
      AppLocalizationManager localization) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocListener<ImageGeneratorBloc, ImageGeneratorState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: _listenStateChange,
        child: Scaffold(
          appBar: NormalAppBar(
            appTheme: appTheme,
            title: localization.translate(
              LanguageKey.imageGeneratorScreenAppBarTitle,
            ),
          ),
          body: ImageGeneratorScreenStatusSelector(
            builder: (screenStatus) {
              switch (screenStatus) {
                case ImageGeneratorScreenStatus.none:
                case ImageGeneratorScreenStatus.loading:
                  return Center(
                    child: AppLoadingWidget(
                      appTheme: appTheme,
                    ),
                  );
                case ImageGeneratorScreenStatus.loaded:
                case ImageGeneratorScreenStatus.error:
                  return child;
              }
            },
          ),
        ),
      ),
    );
  }

  void _listenStateChange(BuildContext context, ImageGeneratorState state) {
    switch (state.status) {
      case ImageGeneratorStatus.none:
        break;
      case ImageGeneratorStatus.generating:
        showLoading();
        break;
      case ImageGeneratorStatus.generated:
        hideLoading();
        AppNavigator.push(
          RoutePath.imageGeneratorFinalize,
          state.completedTasks,
        );
        break;
      case ImageGeneratorStatus.failed:
        showToast(state.error ?? '');
        hideLoading();
        break;
    }
  }
}
