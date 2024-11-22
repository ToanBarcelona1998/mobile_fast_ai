import 'package:domain/domain.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/utils/copy.dart';
import 'package:mobile_fast_ai/src/cores/utils/flutter_toast.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/base_screen.dart';
import 'widgets/bottom_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/prompt_widget.dart';

class ImageToPromptResultScreen extends StatefulWidget {
  final List<AITask> tasks;

  // add more arguments here

  const ImageToPromptResultScreen({
    required this.tasks,
    super.key,
  });

  @override
  State<ImageToPromptResultScreen> createState() =>
      _ImageToPromptResultScreenState();
}

class _ImageToPromptResultScreenState
    extends State<ImageToPromptResultScreen> with StateFulBaseScreen , CustomFlutterToast , Copy {
  @override
  Widget child(BuildContext context, AppTheme appTheme,
      AppLocalizationManager localization) {
    return Column(
      children: [
        Expanded(
          child: ImageToPromptResultPromptWidget(
            appTheme: appTheme,
            localization: localization,
            prompt: widget.tasks[0].data,
          ),
        ),
        ImageToPromptResultBottomWidget(
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
      backgroundColor: appTheme.bodyBackGroundColor,
      appBar: NormalAppBar(
        appTheme: appTheme,
        title: localization.translate(
          LanguageKey.imageToPromptResultScreenAppBarTitle,
        ),
      ),
      body: child,
    );
  }
}
