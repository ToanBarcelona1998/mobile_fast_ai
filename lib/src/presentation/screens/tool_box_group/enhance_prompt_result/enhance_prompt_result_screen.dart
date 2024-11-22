import 'package:domain/domain.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/cores/utils/copy.dart';
import 'package:mobile_fast_ai/src/cores/utils/flutter_toast.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/enhance_prompt_result/widgets/prompt_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/base_screen.dart';
import 'widgets/bottom_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class EnhancePromptResultScreen extends StatefulWidget {
  final List<AITask> tasks;

  const EnhancePromptResultScreen({
    required this.tasks,
    super.key,
  });

  @override
  State<EnhancePromptResultScreen> createState() =>
      _EnhancePromptResultScreenState();
}

class _EnhancePromptResultScreenState extends State<EnhancePromptResultScreen>
    with StateFulBaseScreen  , CustomFlutterToast, Copy{
  @override
  Widget child(BuildContext context, AppTheme appTheme,
      AppLocalizationManager localization) {
    return Column(
      children: [
        Expanded(
          child: EnhancePromptResultPromptWidget(
            localization: localization,
            appTheme: appTheme,
            prompt: widget.tasks[0].data,
          ),
        ),
        EnhancePromptResultScreenBottomWidget(
          appTheme: appTheme,
          localization: localization,
          onCopy: () => copy(widget.tasks[0].data),
        ),
      ],
    );
  }

  @override
  Widget wrapBuild(BuildContext context, Widget child, AppTheme appTheme,
      AppLocalizationManager localization) {
    return Scaffold(
      appBar: NormalAppBar(
        appTheme: appTheme,
        title: localization.translate(
          LanguageKey.enhancePromptResultScreenAppBarTitle,
        ),
      ),
      body: child,
    );
  }
}
