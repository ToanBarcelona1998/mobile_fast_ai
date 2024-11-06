import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/combine_list_view.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiscoverSearchScreen extends StatefulWidget {
  const DiscoverSearchScreen({super.key});

  @override
  State<DiscoverSearchScreen> createState() => _DiscoverSearchScreenState();
}

class _DiscoverSearchScreenState extends State<DiscoverSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
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
                titleWidget: TextInputWithBoxFormWidget(
                  controller: _searchController,
                  enableClear: true,
                  leading: SvgPicture.asset(
                    AssetIconPath.icCommonSearch,
                  ),
                  onChanged: (query, _) {},
                  maxLine: 1,
                  onClear: () {},
                ),
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.spacing05,
                    vertical: Spacing.spacing07,
                  ),
                  child: Column(
                    children: [
                      TextWithIconWidget(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        title: localization.translate(
                          LanguageKey.searchDiscoverPostScreenRecent,
                        ),
                        icSvgPath: AssetIconPath.icCommonClose,
                        appTheme: appTheme,
                        style: AppTypography.heading5SemiBold.copyWith(
                          color: appTheme.greyScaleColor900,
                        ),
                      ),
                      const SizedBox(
                        height: BoxSize.boxSize05,
                      ),
                      HoLiZonTalDividerWidget(
                        appTheme: appTheme,
                      ),
                      const SizedBox(
                        height: BoxSize.boxSize05,
                      ),
                      Expanded(
                        child: CombinedListView(
                          onRefresh: () {
                            //
                          },
                          onLoadMore: () {
                            //
                          },
                          data: const [
                            1,
                            2,
                            3,
                            4,
                            5,
                            6,
                            7,
                            8,
                          ],
                          builder: (_, __) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                bottom: Spacing.spacing07,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  AppNavigator.push(
                                    RoutePath.discoverSearchResult,
                                    '3D Realistic Dragon in the Forest',
                                  );
                                },
                                behavior: HitTestBehavior.opaque,
                                child: CustomDualWidgetRow(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  firstChildWidget: Expanded(
                                    child: Text(
                                      '3D Realistic Dragon in the Forest',
                                      style:
                                          AppTypography.heading6SemiBold.copyWith(
                                        color: appTheme.greyScaleColor700,
                                      ),
                                    ),
                                  ),
                                  secondChildWidget: SvgPicture.asset(
                                    AssetIconPath.icCommonClose,
                                  ),
                                  appTheme: appTheme,
                                ),
                              ),
                            );
                          },
                          canLoadMore: false,
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
