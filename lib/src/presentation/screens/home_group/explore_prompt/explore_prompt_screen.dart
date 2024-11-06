import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/screens/home_group/explore_prompt/widgets/expolore_prompt_detail_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/full_screen_dialog_layout.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExplorePromptScreen extends StatefulWidget {
  const ExplorePromptScreen({super.key});

  @override
  State<ExplorePromptScreen> createState() => _ExplorePromptScreenState();
}

class _ExplorePromptScreenState extends State<ExplorePromptScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                title: localization.translate(
                  LanguageKey.explorePromptScreenAppBarTitle,
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
                      SearchWidget(
                        appTheme: appTheme,
                        hint: localization.translate(
                          LanguageKey.explorePromptScreenSearchHint,
                        ),
                        searchController: _searchController,
                        onChanged: (value, isValid) {},
                      ),
                      const SizedBox(
                        height: BoxSize.boxSize07,
                      ),
                      Expanded(
                        child: MasonryGridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: Spacing.spacing04,
                          crossAxisSpacing: Spacing.spacing05,
                          itemCount: dummyImages.length,
                          itemBuilder: (context, index) {
                            final String url = dummyImages[index];
                            return GestureDetector(
                              onTap: () => _onClick(
                                url,
                                appTheme,
                                localization,
                              ),
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

  void _onClick(
    String url,
    AppTheme appTheme,
    AppLocalizationManager localization,
  ) {
    FullScreenDialogLayout.showFullScreenDialog(
      context,
      child: ExplorePromptDetailWidget(
        appTheme: appTheme,
        localization: localization,
        imgUrl: url,
        onTryClick: () {
          // pop to home page and something else as argument
          AppNavigator.pop();
        },
        description:
            'A futuristic robot walking on the rain covered street, in the style of edgy caricatures, lit kid, piratepunk, ...',
      ),
    );
  }
}
