import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/batch_art_generator_list/widgets/generate_image_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/combined_gridview.dart';
import 'widgets/bottom_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class BatchArtGeneratorListScreen extends StatefulWidget {
  const BatchArtGeneratorListScreen({super.key});

  @override
  State<BatchArtGeneratorListScreen> createState() =>
      _BatchArtGeneratorListScreenState();
}

class _BatchArtGeneratorListScreenState
    extends State<BatchArtGeneratorListScreen> {
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
                  LanguageKey.batchArtGeneratorListScreenAppBarTitle,
                ),
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: Spacing.spacing07,
                          horizontal: Spacing.spacing05,
                        ),
                        child: CombinedGridView(
                          childCount: 2,
                          onRefresh: () {},
                          onLoadMore: () {},
                          data: dummyImages,
                          builder: (url, _) {
                            return GestureDetector(
                              onTap: () {
                                AppNavigator.push(
                                  RoutePath.batchArtGeneratorDetail,
                                  url,
                                );
                              },
                              child: BatchArtGeneratorListImageWidget(
                                url: url,
                                appTheme: appTheme,
                                onDownload: (_) {},
                              ),
                            );
                          },
                          canLoadMore: false,
                          childAspectRatio: 0.9,
                          crossAxisSpacing: Spacing.spacing04,
                          mainAxisSpacing: Spacing.spacing05,
                        ),
                      ),
                    ),
                    BatchArtGeneratorListBottomWidget(
                      appTheme: appTheme,
                      localization: localization,
                      onReGenerateTap: () {},
                      onDownloadAllTap: () {},
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
