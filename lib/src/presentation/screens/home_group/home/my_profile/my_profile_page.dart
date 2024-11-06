import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/information_widget.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );
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
                title: localization.translate(
                  LanguageKey.userProfileScreenAppBarTitle,
                ),
                actions: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      AppNavigator.push(
                        RoutePath.setting,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.spacing05,
                      ),
                      child: SvgPicture.asset(
                        AssetIconPath.icCommonSetting,
                      ),
                    ),
                  )
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
                      MyProfileInformationWidget(
                        appTheme: appTheme,
                        description: 'Andrew Art',
                        localization: localization,
                        userName: 'andrew.art',
                        avatar: randomDummyImg(),
                        onEdit: () {
                          AppNavigator.push(
                            RoutePath.editProfile,
                          );
                        },
                      ),
                      const SizedBox(
                        height: BoxSize.boxSize05,
                      ),
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
                            width: context.w / 3,
                            child: Tab(
                              text: localization.translate(
                                LanguageKey.userProfileScreenCreated,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.w / 3,
                            child: Tab(
                              text: localization.translate(
                                LanguageKey.userProfileScreenLiked,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.w / 3,
                            child: Tab(
                              text: localization.translate(
                                LanguageKey.userProfileScreenSaved,
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
                            MasonryGridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: Spacing.spacing04,
                              crossAxisSpacing: Spacing.spacing05,
                              itemCount: dummyImages.length,
                              itemBuilder: (context, index) {
                                final String url = dummyImages[index];
                                return GestureDetector(
                                  onTap: () {},
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
                            MasonryGridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: Spacing.spacing04,
                              crossAxisSpacing: Spacing.spacing05,
                              itemCount: dummyImages.length,
                              itemBuilder: (context, index) {
                                final String url = dummyImages[index];
                                return GestureDetector(
                                  onTap: () {},
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
                            MasonryGridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: Spacing.spacing04,
                              crossAxisSpacing: Spacing.spacing05,
                              itemCount: dummyImages.length,
                              itemBuilder: (context, index) {
                                final String url = dummyImages[index];
                                return GestureDetector(
                                  onTap: () {},
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
