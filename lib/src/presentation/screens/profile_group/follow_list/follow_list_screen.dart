import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/screens/profile_group/follow_list/widgets/follow_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/combine_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FollowListScreen extends StatefulWidget {
  const FollowListScreen({super.key});

  @override
  State<FollowListScreen> createState() => _FollowListScreenState();
}

class _FollowListScreenState extends State<FollowListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (appTheme) {
        return AppLocalizationProvider(
          builder: (localization) {
            return Scaffold(
              appBar: NormalAppBar(
                appTheme: appTheme,
                actions: [
                  GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.spacing05,
                      ),
                      child: SvgPicture.asset(
                        AssetIconPath.icCommonSearch,
                      ),
                    ),
                  ),
                ],
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.spacing05,
                    vertical: Spacing.spacing07,
                  ),
                  child: Column(
                    children: [
                      TabBar(
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
                        dividerColor: appTheme.greyScaleColor200,
                        tabs: [
                          SizedBox(
                            width: context.w / 2,
                            child: Tab(
                              text: localization.translate(
                                LanguageKey.followListScreenFollowers,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.w / 2,
                            child: Tab(
                              text: localization.translate(
                                LanguageKey.followListScreenFollowing,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: BoxSize.boxSize05,
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            CombinedListView(
                              onRefresh: () {},
                              onLoadMore: () {},
                              data: const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                              builder: (p0, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: Spacing.spacing05,
                                  ),
                                  child: FollowListFollowerWidget(
                                    avatar: randomDummyImg(),
                                    description: 'Artistic Soul',
                                    name: randomDummyImgTitle(),
                                    appTheme: appTheme,
                                    localization: localization,
                                    onTap: () {},
                                    onFollowTap: () {},
                                    followed: index % 2 == 0,
                                  ),
                                );
                              },
                              canLoadMore: false,
                            ),
                            CombinedListView(
                              onRefresh: () {},
                              onLoadMore: () {},
                              data: const [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                              builder: (p0, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: Spacing.spacing05,
                                  ),
                                  child: FollowListFollowingWidget(
                                    avatar: randomDummyImg(),
                                    description: 'Artistic Soul',
                                    name: randomDummyImgTitle(),
                                    appTheme: appTheme,
                                    localization: localization,
                                    onTap: () {},
                                    onFollowTap: () {},
                                    followed: index % 2 == 0,
                                  ),
                                );
                              },
                              canLoadMore: false,
                            ),
                          ],
                        ),
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
