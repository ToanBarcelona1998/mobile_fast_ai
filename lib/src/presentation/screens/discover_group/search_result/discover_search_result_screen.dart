import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/screens/discover_group/search_result/widgets/creator_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/combine_list_view.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiscoverSearchResultScreen extends StatefulWidget {
  final String query;

  const DiscoverSearchResultScreen({
    required this.query,
    super.key,
  });

  @override
  State<DiscoverSearchResultScreen> createState() =>
      _DiscoverSearchResultScreenState();
}

class _DiscoverSearchResultScreenState extends State<DiscoverSearchResultScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _searchController.text = widget.query;
    super.initState();
  }

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
                titleWidget: TextInputWithBoxFormWidget(
                  leading: SvgPicture.asset(
                    AssetIconPath.icCommonSearch,
                  ),
                  controller: _searchController,
                  enableClear: true,
                  maxLine: 1,
                  onClear: () {},
                ),
                bottomWidget: TabBar(
                  controller: _tabController,
                  labelStyle: AppTypography.bodyXLargeSemiBold.copyWith(
                    color: appTheme.primaryColor900,
                  ),
                  unselectedLabelStyle:
                      AppTypography.bodyXLargeSemiBold.copyWith(
                    color: appTheme.greyScaleColor500,
                  ),
                  onTap: (value) {},
                  indicatorColor: appTheme.primaryColor900,
                  tabs: [
                    SizedBox(
                      width: context.w / 2,
                      child: Tab(
                        text: localization.translate(
                          LanguageKey.searchPostResultScreenCreator,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.w / 2,
                      child: Tab(
                        text: localization.translate(
                          LanguageKey.searchPostResultScreenArtWork,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Spacing.spacing07,
                    horizontal: Spacing.spacing05,
                  ),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      CombinedListView(
                        onRefresh: () {},
                        onLoadMore: () {},
                        data: const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                        builder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: Spacing.spacing07,
                            ),
                            child: DiscoverSearchResultCreatorWidget(
                              avatar: randomDummyImg(),
                              creatorDescription: 'Artistic Soul',
                              creatorName: randomDummyImgTitle(),
                              appTheme: appTheme,
                              localization: localization,
                              followed: index % 2 == 0,
                              onTap: () {
                                AppNavigator.push(
                                  RoutePath.creatorDetail,
                                );
                              },
                              onFollowTap: () {},
                            ),
                          );
                        },
                        canLoadMore: false,
                      ),
                      MasonryGridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: Spacing.spacing04,
                        crossAxisSpacing: Spacing.spacing05,
                        itemCount: dummyImages.length,
                        itemBuilder: (context, index) {
                          final String url = dummyImages[index];
                          return GestureDetector(
                            onTap: () {
                              AppNavigator.push(
                                RoutePath.post,
                              );
                            },
                            behavior: HitTestBehavior.opaque,
                            child: NetworkImageWidget(
                              imageUrl: url,
                              appTheme: appTheme,
                              height: (index % 5 + 1) * BoxSize.boxSize13,
                            ),
                          );
                        },
                        padding: EdgeInsets.zero,
                      ),
                    ],
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
