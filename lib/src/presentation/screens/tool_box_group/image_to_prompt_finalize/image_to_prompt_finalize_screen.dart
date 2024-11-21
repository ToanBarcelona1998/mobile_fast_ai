import 'package:domain/domain.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/base_screen.dart';
import 'widgets/bottom_widget.dart';
import 'widgets/content_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class ImageToPromptFinalizeScreen extends StatefulWidget {
  final List<AITask> tasks;

  // add more arguments here

  const ImageToPromptFinalizeScreen({
    required this.tasks,
    super.key,
  });

  @override
  State<ImageToPromptFinalizeScreen> createState() =>
      _ImageToPromptFinalizeScreenState();
}

class _ImageToPromptFinalizeScreenState extends State<ImageToPromptFinalizeScreen> with StateFulBaseScreen{

  @override
  Widget child(BuildContext context, AppTheme appTheme, AppLocalizationManager localization) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                NetworkImageWidget(
                  imageUrl: widget.tasks[0].data,
                  appTheme: appTheme,
                  width: double.maxFinite,
                  height: context.h * 0.45,
                ),
                const SizedBox(
                  height: BoxSize.boxSize05,
                ),
                ImageToPromptFinalizeContentWidget(
                  title: '3D Donut with Chocolate & Sprinkles',
                  appTheme: appTheme,
                  localization: localization,
                ),
              ],
            ),
          ),
        ),
        ImageToPromptFinalizeBottomWidget(
          appTheme: appTheme,
          localization: localization,
          onDownloadArt: () {},
          onShareToFeed: () {},
        ),
      ],
    );
  }

  @override
  Widget wrapBuild(BuildContext context, Widget child, AppTheme appTheme, AppLocalizationManager localization) {
    return Scaffold(
      backgroundColor: appTheme.bodyBackGroundColor,
      appBar: NormalAppBar(
        appTheme: appTheme,
        title: localization.translate(
          LanguageKey.imageToPromptFinalizeScreenAppBarTitle,
        ),
      ),
      body: child,
    );
  }
}
