import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/screens/discover_group/post/widgets/post_remix_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bottom_sheet_provider.dart';
import 'widgets/post_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/combine_list_view.dart';
import 'package:flutter/material.dart';

class DiscoverPostScreen extends StatefulWidget {
  const DiscoverPostScreen({super.key});

  @override
  State<DiscoverPostScreen> createState() => _DiscoverPostScreenState();
}

class _DiscoverPostScreenState extends State<DiscoverPostScreen> {
  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (appTheme) {
        return AppLocalizationProvider(
          builder: (localization) {
            return Scaffold(
              backgroundColor: appTheme.bodyBackGroundColor,
              appBar: NormalAppBar(
                appTheme: appTheme,
                title: localization.translate(
                  LanguageKey.discoverPostScreenAppBarTitle,
                ),
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Spacing.spacing07,
                    horizontal: Spacing.spacing05,
                  ),
                  child: CombinedListView(
                    onRefresh: () {},
                    onLoadMore: () {},
                    data: const [
                      1,
                      2,
                      3,
                      4,
                      5,
                      6,
                      7,
                    ],
                    builder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: Spacing.spacing06,
                        ),
                        child: PostWidget(
                          title: 'Portrait of Woman with Tattoo',
                          cfgScale: '8',
                          postUserName: 'imagine.art',
                          imgUrl: randomDummyImg(),
                          avatar: randomDummyImg(),
                          negativePrompt:
                              'forges, john goodman as donald trump, jack russel dog, herluf bidstrup, width 768, bob clampett, cartoon, steamboat willy, vf-1s jetfire, paw pov',
                          prompt:
                              'a close up of a woman with tattoos on her face, mandy jurgens golden ratio, award-winning render, dan mumford. maya render, the artist has used bright, oil painting of princess vulvine, beautiful portrait of a hopeless, vogue render, wojtek fus, realism : 9 5 %, punk portrait made out of paint',
                          seed: '84731047293',
                          totalLike: 123 * index,
                          appTheme: appTheme,
                          localization: localization,
                          liked: index % 2 == 0,
                          onLikeTap: () {},
                          onSendTap: () {},
                          onDownloadArtWorkTap: () {},
                          onReportTap: () {
                            // Push to post report screen with id post
                            AppNavigator.push(RoutePath.postReport, 0);
                          },
                          onSaveArtWorkTap: () {},
                          onRemixTap: () {
                            _onRemixTap(
                              appTheme: appTheme,
                              localization: localization,
                            );
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

  void _onRemixTap({
    required AppTheme appTheme,
    required AppLocalizationManager localization,
  }) {
    AppBottomSheetProvider.showNormalBottomSheet(
      context,
      theme: appTheme,
      child: PostRemixWidget(
        appTheme: appTheme,
        localization: localization,
        onUseInputImage: () {},
        onCreateArtWithPrompt: () {},
        onTryStyle: () {},
      ),
    );
  }
}
