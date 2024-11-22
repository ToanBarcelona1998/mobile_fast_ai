import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_fast_ai/config/di.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/flutter_toast.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/base_screen.dart';
import 'widgets/enter_prompt_widget.dart';
import 'widgets/bottom_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'enhance_prompt_input_bloc.dart';
import 'enhance_prompt_input_state.dart';

class EnhancePromptInputScreen extends StatefulWidget {
  const EnhancePromptInputScreen({super.key});

  @override
  State<EnhancePromptInputScreen> createState() =>
      _EnhancePromptInputScreenState();
}

class _EnhancePromptInputScreenState extends State<EnhancePromptInputScreen>
    with StateFulBaseScreen, CustomFlutterToast {
  final TextEditingController _enterPromptController = TextEditingController();

  final EnhancePromptInputBloc _bloc = getIt.get<EnhancePromptInputBloc>();

  @override
  void dispose() {
    _enterPromptController.dispose();
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
                EnhancePromptInputEnterPromptWidget(
                  enterPromptController: _enterPromptController,
                  localization: localization,
                ),
                const SizedBox(
                  height: BoxSize.boxSize05,
                ),
              ],
            ),
          ),
        ),
        EnhancePromptInputBottomWidget(
          localization: localization,
          appTheme: appTheme,
        ),
      ],
    );
  }

  @override
  Widget wrapBuild(BuildContext context, Widget child, AppTheme appTheme,
      AppLocalizationManager localization) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocListener<EnhancePromptInputBloc, EnhancePromptInputState>(
        listener: _listenStateChange,
        listenWhen: (previous, current) => previous.status != current.status,
        child: Scaffold(
          appBar: NormalAppBar(
            appTheme: appTheme,
            title: localization.translate(
              LanguageKey.enhancePromptInputScreenAppBarTitle,
            ),
          ),
          body: child,
        ),
      ),
    );
  }

  void _listenStateChange(BuildContext context, EnhancePromptInputState state) {
    switch (state.status) {
      case EnhancePromptInputStatus.none:
        break;
      case EnhancePromptInputStatus.generating:
        showLoading();
        break;
      case EnhancePromptInputStatus.generated:
        hideLoading();
        AppNavigator.push(
          RoutePath.enhancePromptResult,
          state.tasks,
        );
        break;
      case EnhancePromptInputStatus.failed:
        hideLoading();
        showToast(state.error ?? '');
        break;
    }
  }
}
