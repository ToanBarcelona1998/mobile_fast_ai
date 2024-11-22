import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_fast_ai/config/di.dart';
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
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_loading_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/base_screen.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/information_widget.dart';

import 'my_profile_state.dart';
import 'my_profile_bloc.dart';
import 'my_profile_event.dart';
import 'my_profile_selector.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage>
    with StateFulBaseScreen, SingleTickerProviderStateMixin {
  late TabController _tabController;
  final MyProfileBloc _bloc = getIt.get<MyProfileBloc>();

  @override
  void initState() {
    _tabController = TabController(
      length: 3,
      vsync: this,
    );

    _bloc.add(
      const MyProfileEventOnInit(),
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget child(BuildContext context, AppTheme appTheme,
      AppLocalizationManager localization) {
    return Column(
      children: [
        MyProfileUserSelector(
          builder: (user) {
            return MyProfileInformationWidget(
              appTheme: appTheme,
              description: 'Andrew Art',
              localization: localization,
              userName: user?.name ?? '',
              avatar: user?.avatar ?? '',
              onEdit: () {
                AppNavigator.push(
                  RoutePath.editProfile,
                );
              },
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
          unselectedLabelStyle: AppTypography.bodyXLargeSemiBold.copyWith(
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
    );
  }

  @override
  Widget wrapBuild(BuildContext context, Widget child, AppTheme appTheme,
      AppLocalizationManager localization) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
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
        body: MyProfileScreenStatusSelector(
          builder: (status) {
            switch (status) {
              case MyProfileScreenStatus.loading:
                return Center(
                  child: AppLoadingWidget(
                    appTheme: appTheme,
                  ),
                );
              case MyProfileScreenStatus.loaded:
              case MyProfileScreenStatus.error:
                return child;
            }
          },
        ),
      ),
    );
  }
}
