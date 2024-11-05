import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/combined_gridview.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/search_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/simple_network_image_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArtStyleScreen extends StatefulWidget {
  const ArtStyleScreen({super.key});

  @override
  State<ArtStyleScreen> createState() => _ArtStyleScreenState();
}

class _ArtStyleScreenState extends State<ArtStyleScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<String> _selectedImg = List.empty(growable: true);

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
              backgroundColor: appTheme.bodyBackGroundColor,
              appBar: NormalAppBar(
                appTheme: appTheme,
                title: localization.translate(
                  LanguageKey.artStyleScreenAppBarTitle,
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
                          LanguageKey.artStyleScreenSearchHint,
                        ),
                        searchController: _searchController,
                        onChanged: (value, isValid) {},
                      ),
                      const SizedBox(
                        height: BoxSize.boxSize07,
                      ),
                      Expanded(
                        child: CombinedGridView(
                          childCount: 2,
                          onRefresh: () {},
                          onLoadMore: () {},
                          data: dummyImages,
                          builder: (url, _) {
                            bool isSelected = _selectedImg.contains(url);
                            return GestureDetector(
                              onTap: () {
                                _onSelectArt(url);
                              },
                              child: SimpleNetworkImageFixedColumnInfoWidget(
                                imgTitle: randomDummyImgTitle(),
                                imgUrl: url,
                                appTheme: appTheme,
                                style: isSelected
                                    ? AppTypography.heading6Bold.copyWith(
                                        color: appTheme.primaryColor900,
                                      )
                                    : null,
                                fillImg: isSelected
                                    ? Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: appTheme.primaryColor900,
                                            width: BorderSize.border04,
                                          ),
                                          color: appTheme.otherColorBlack
                                              .withOpacity(
                                            0.2,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            BorderRadiusSize.borderRadius03,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: SvgPicture.asset(
                                          AssetIconPath.icCommonCheckWhite,
                                        ),
                                      )
                                    : null,
                              ),
                            );
                          },
                          canLoadMore: false,
                          childAspectRatio: 0.85,
                          crossAxisSpacing: Spacing.spacing04,
                          mainAxisSpacing: Spacing.spacing05,
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

  void _onSelectArt(String url) {
    if (_selectedImg.contains(url)) {
      _selectedImg.remove(url);
    } else {
      _selectedImg.add(url);
    }

    setState(() {});
  }
}
