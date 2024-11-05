import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/text_effect/widgets/text_effect_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/combined_gridview.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/bottom_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class TextEffectScreen extends StatefulWidget {
  const TextEffectScreen({super.key});

  @override
  State<TextEffectScreen> createState() => _TextEffectScreenState();
}

class _TextEffectScreenState extends State<TextEffectScreen> {
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
                  LanguageKey.textEffectScreenAppBarTitle,
                ),
                actions: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.spacing05,
                      ),
                      child: SvgPicture.asset(
                        AssetIconPath.icCommonSearch,
                        color: appTheme.otherColorBlack,
                      ),
                    ),
                  ),
                ],
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Spacing.spacing05,
                          vertical: Spacing.spacing07,
                        ),
                        child: CombinedGridView(
                          childCount: 2,
                          onRefresh: () {},
                          onLoadMore: () {},
                          data: dummyTextEffect,
                          builder: (url, __) {
                            return TextEffectWidget(
                              thumpUrl: url,
                              appTheme: appTheme,
                              localization: localization,
                              onTryTap: () {},
                            );
                          },
                          canLoadMore: false,
                          childAspectRatio: 0.85,
                          crossAxisSpacing: Spacing.spacing04,
                          mainAxisSpacing: Spacing.spacing05,
                        ),
                      ),
                    ),
                    TextEffectBottomWidget(
                      localization: localization,
                      appTheme: appTheme,
                      onTap: () {
                        AppNavigator.push(
                          RoutePath.textEffectOwn,
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
