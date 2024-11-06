import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/screens/discover_group/creator_detail/widgets/creator_popup_widget.dart';
import 'package:mobile_fast_ai/src/presentation/screens/discover_group/creator_detail/widgets/creator_show_qr_code_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bottom_sheet_provider.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/popup_menu_widget.dart';
import 'widgets/creator_information_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CreatorDetailScreen extends StatefulWidget {
  const CreatorDetailScreen({super.key});

  @override
  State<CreatorDetailScreen> createState() => _CreatorDetailScreenState();
}

class _CreatorDetailScreenState extends State<CreatorDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
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
                actions: [
                  PopupMenuWidget(
                    appTheme: appTheme,
                    children: [
                      PopupMenuItem(
                        child: CreatorPopupWidget(
                          appTheme: appTheme,
                          title: localization.translate(
                            LanguageKey.creatorDetailScreenCopyProfileUrl,
                          ),
                          iconPath: AssetIconPath.icCommonCopy,
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          _showQrCode(
                            appTheme: appTheme,
                            localization: localization,
                            creatorName: '@imagine.art',
                            url: randomDummyImg(),
                          );
                        },
                        child: CreatorPopupWidget(
                          appTheme: appTheme,
                          title: localization.translate(
                            LanguageKey.creatorDetailScreenShowQrCode,
                          ),
                          iconPath: AssetIconPath.icCommonQr,
                        ),
                      ),
                      PopupMenuItem(
                        child: CreatorPopupWidget(
                          appTheme: appTheme,
                          title: localization.translate(
                            LanguageKey.creatorDetailScreenShareThisProfile,
                          ),
                          iconPath: AssetIconPath.icCommonSend,
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {
                          // Push to post report screen with id post
                          AppNavigator.push(RoutePath.postReport, 0);
                        },
                        child: CreatorPopupWidget(
                          appTheme: appTheme,
                          title: localization.translate(
                            LanguageKey.creatorDetailScreenReport,
                          ),
                          iconPath: AssetIconPath.icCommonReport,
                          displayDivider: false,
                        ),
                      ),
                    ],
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
                      CreatorInformationWidget(
                        appTheme: appTheme,
                        creatorDescription: 'Imagine Art',
                        localization: localization,
                        creatorName: 'imagine.art',
                        avatar: randomDummyImg(),
                        artWork: 675,
                        following: 128,
                        followers: 24600,
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
                            width: context.w / 2,
                            child: Tab(
                              text: localization.translate(
                                LanguageKey.creatorDetailScreenCreated,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.w / 2,
                            child: Tab(
                              text: localization.translate(
                                LanguageKey.creatorDetailScreenLiked,
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
                      const SizedBox(
                        height: BoxSize.boxSize05,
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

  void _showQrCode({
    required AppTheme appTheme,
    required AppLocalizationManager localization,
    required String creatorName,
    required String url,
  }) {
    // AppBottomSheetProvider.showMediumBottomSheet(
    //   context,
    //   theme: appTheme,
    //   child: CreatorShowQrCodeWidget(
    //     appTheme: appTheme,
    //     localization: localization,
    //     url: url,
    //     creatorName: creatorName,
    //   ),
    // );
  }
}
