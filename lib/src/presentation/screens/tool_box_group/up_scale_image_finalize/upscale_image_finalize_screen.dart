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

class UpscaleImageFinalizeScreen extends StatefulWidget {
  final List<AITask> tasks;

  // add more arguments here

  const UpscaleImageFinalizeScreen({
    required this.tasks,
    super.key,
  });

  @override
  State<UpscaleImageFinalizeScreen> createState() => _UpscaleImageFinalizeScreenState();
}

class _UpscaleImageFinalizeScreenState extends State<UpscaleImageFinalizeScreen> with StateFulBaseScreen{

  @override
  Widget child(BuildContext context, AppTheme appTheme, AppLocalizationManager localization) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.spacing05,
                vertical: Spacing.spacing07,
              ),
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
                  UpscaleImageFinalizeContentWidget(
                    title: 'Chibi Alien Cyberpunk Robo',
                    appTheme: appTheme,
                    localization: localization,
                  ),
                ],
              ),
            ),
          ),
        ),
        UpscaleImageFinalizeBottomWidget(
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
          LanguageKey.upscaleImageFinalizeScreenAppBarTitle,
        ),
      ),
      body: child,
    );
  }
}
