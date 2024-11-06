import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/screens/home_group/home/tool_box_page/widgets/tool_box_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/combine_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ToolBoxPage extends StatefulWidget {
  const ToolBoxPage({super.key});

  @override
  State<ToolBoxPage> createState() => _ToolBoxPageState();
}

class _ToolBoxPageState extends State<ToolBoxPage> {
  List<AIType> listData = [
    AIType(
        title: 'AI Avatar Generator',
        imageUrl:
            'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA',
        description: 'Turn your photo or selfie into an AI avatar',
        type: 1),
    AIType(
        title: 'Anime Generator',
        imageUrl:
            'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA',
        description: 'Turn your words or prompt into an anime',
        type: 2),
    AIType(
        title: 'Photo to Anime',
        imageUrl:
            'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA',
        description: 'Turn your photo or selfie into an anime',
        type: 3),
    AIType(
        title: 'Realistic Art Generator',
        imageUrl:
            'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA',
        description: 'Turn your photo or selfie into a realistic art',
        type: 4),
    AIType(
        title: 'Text Effects',
        imageUrl:
            'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA',
        description: 'Turn your photo or selfie into a realistic art',
        type: 5),
    AIType(
        title: 'Sketch to Images',
        imageUrl:
            'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA',
        description: 'Turn your photo or selfie into a fantasy art',
        type: 6),
    AIType(
        title: 'Images to Painting',
        imageUrl:
            'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA',
        description: 'Turn your text into a cool text effect',
        type: 7),
    AIType(
        title: 'Recolor Images',
        imageUrl:
            'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA',
        description: 'Turn your 3D model into an image',
        type: 8),
    AIType(
        title: 'Extend Images',
        imageUrl:
            'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA',
        description: 'Turn your text into a pattern',
        type: 9),
    AIType(
        title: '3D to Images',
        imageUrl:
            'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA',
        description: 'Turn your text into a logo',
        type: 10),
    AIType(
        title: 'Text to Pattern',
        imageUrl:
            'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA',
        description: 'Turn your photo or selfie into an AI avatar',
        type: 11),
    AIType(
        title: 'Logo Generator',
        imageUrl:
            'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA',
        description: 'Turn your photo or selfie into an AI avatar',
        type: 12),
    AIType(
        title: 'ControlNet',
        imageUrl:
            'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA',
        description: 'Turn your photo or selfie into an AI avatar',
        type: 13),
    AIType(
        title: 'Batch Art Generator',
        imageUrl:
            'https://play-lh.googleusercontent.com/7Ak4Ye7wNUtheIvSKnVgGL_OIZWjGPZNV6TP_3XLxHC-sDHLSE45aDg41dFNmL5COA',
        description: 'Turn your photo or selfie into an AI avatar',
        type: 14),
  ];

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (appTheme) {
        return AppLocalizationProvider(
          builder: (localization) {
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
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.spacing05,
                    vertical: Spacing.spacing07,
                  ),
                  child: CombinedListView(
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
                              case 1:
                                AppNavigator.push(
                                  RoutePath.avatarGenerator,
                                );
                                break;
                              case 2:
                                AppNavigator.push(
                                  RoutePath.animeGenerator,
                                );
                                break;
                              case 3:
                                AppNavigator.push(
                                  RoutePath.photoToAnimeUpload,
                                );
                                break;
                              case 4:
                                AppNavigator.push(
                                  RoutePath.realisticGenerator,
                                );
                                break;
                              case 5:
                                AppNavigator.push(
                                  RoutePath.textEffect,
                                );
                                break;
                              case 6:
                                AppNavigator.push(
                                  RoutePath.sketchToImageUpload,
                                );
                                break;
                              case 7:
                                AppNavigator.push(
                                  RoutePath.imageToPaintingUpload,
                                );
                              case 8:
                                AppNavigator.push(
                                  RoutePath.recolorImageUpload,
                                );
                                break;
                              case 9:
                                AppNavigator.push(
                                  RoutePath.extendImageUpload,
                                );
                                break;
                              case 10:
                                AppNavigator.push(
                                  RoutePath.threeDToImageUpload,
                                );
                                break;
                              case 11:
                                AppNavigator.push(
                                  RoutePath.textToPattern,
                                );
                                break;
                              case 12:
                                AppNavigator.push(
                                  RoutePath.logoGenerator,
                                );
                                break;
                              case 13:
                                AppNavigator.push(
                                  RoutePath.controlNetUpload,
                                );
                                break;
                              case 14:
                                AppNavigator.push(
                                  RoutePath.batchArtGenerator,
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
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class AIType {
  final String title;
  final String imageUrl;
  final String description;
  final int type;

  AIType(
      {required this.title,
      required this.imageUrl,
      required this.description,
      required this.type});
}
