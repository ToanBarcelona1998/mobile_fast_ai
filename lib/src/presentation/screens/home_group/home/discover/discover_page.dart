import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
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
                  LanguageKey.discoverPageAppBarTitle,
                ),
                actions: [
                  GestureDetector(
                    onTap: (){
                      AppNavigator.push(RoutePath.discoverSearch);
                    },
                    behavior: HitTestBehavior.opaque,
                    child: SvgPicture.asset(
                      AssetIconPath.icCommonSearch,
                    ),
                  ),
                  const SizedBox(
                    width: BoxSize.boxSize05,
                  ),
                ],
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Spacing.spacing07,
                    horizontal: Spacing.spacing05,
                  ),
                  child: MasonryGridView.count(
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
                ),
              ),
            );
          },
        );
      },
    );
  }
}
