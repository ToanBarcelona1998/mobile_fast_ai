import 'package:domain/domain.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'widgets/tool_box_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/base_screen.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/combine_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

final class AITaskInformation {
  final String title;
  final String imageUrl;
  final String description;
  final AITaskType type;

  AITaskInformation({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.type,
  });
}

class ToolBoxPage extends StatefulWidget {
  const ToolBoxPage({super.key});

  @override
  State<ToolBoxPage> createState() => _ToolBoxPageState();
}

class _ToolBoxPageState extends State<ToolBoxPage> with StateFulBaseScreen {
  final List<AITaskInformation> listData = [
    AITaskInformation(
      title: 'AI generate image',
      imageUrl:
      'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA',
      description: 'Generate an image from your text or prompt',
      type: AITaskType.inference,
    ),
    AITaskInformation(
      title: 'Remove background',
      imageUrl:
      'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA',
      description: 'Automatically remove the background from an image',
      type: AITaskType.removeBackground,
    ),
    AITaskInformation(
      title: 'Upscale image',
      imageUrl:
      'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA',
      description: 'Enhance the quality and resolution of your image',
      type: AITaskType.upscale,
    ),
    AITaskInformation(
      title: 'ControlNet',
      imageUrl:
      'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA',
      description: 'Generate art by using your image as a reference with ControlNet',
      type: AITaskType.controlNet,
    ),
    AITaskInformation(
      title: 'Image to text',
      imageUrl:
      'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA',
      description: 'Extract text from an image using OCR technology',
      type: AITaskType.imageToText,
    ),
    AITaskInformation(
      title: 'Enhance prompt',
      imageUrl:
      'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA',
      description: 'Improve your text prompt for better AI-generated results',
      type: AITaskType.promptEnhance,
    ),
  ];

  @override
  Widget child(BuildContext context, AppTheme appTheme,
      AppLocalizationManager localization) {
    return CombinedListView(
      onRefresh: () {
        //
      },
      onLoadMore: () {
        //
      },
      data: listData,
      builder: (data, _) {
        return Padding(
          padding: const EdgeInsets.only(
            bottom: Spacing.spacing05,
          ),
          child: ToolBoxWidget(
            title: data.title,
            url: data.imageUrl,
            description: data.description,
            appTheme: appTheme,
            onTap: () {
              switch (data.type) {
                case AITaskType.inference:
                  AppNavigator.push(
                    RoutePath.imageGenerator,
                  );
                  break;
                case AITaskType.removeBackground:
                  AppNavigator.push(
                    RoutePath.imageGenerator,
                  );
                  break;
                case AITaskType.upscale:
                  AppNavigator.push(
                    RoutePath.photoToAnimeUpload,
                  );
                  break;
                case AITaskType.imageToText:
                  AppNavigator.push(
                    RoutePath.realisticGenerator,
                  );
                  break;
                case AITaskType.promptEnhance:
                  AppNavigator.push(
                    RoutePath.textEffect,
                  );
                  break;
                case AITaskType.controlNet:
                  AppNavigator.push(
                    RoutePath.sketchToImageUpload,
                  );
                  break;
                default:
                  break;
              }
            },
          ),
        );
      },
      canLoadMore: false,
    );
  }

  @override
  Widget wrapBuild(BuildContext context, Widget child, AppTheme appTheme,
      AppLocalizationManager localization) {
    return Scaffold(
      appBar: NormalAppBar(
        appTheme: appTheme,
        title: localization.translate(
          LanguageKey.toolBoxPageAppBarTitle,
        ),
        leadingWidget: Row(
          children: [
            const SizedBox(
              width: BoxSize.boxSize05,
            ),
            SvgPicture.asset(
              AssetLogoPath.logoSmall,
            )
          ],
        ),
      ),
      body: child,
    );
  }
}
