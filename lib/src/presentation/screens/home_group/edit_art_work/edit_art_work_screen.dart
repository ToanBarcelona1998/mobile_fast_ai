import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/screens/home_group/edit_art_work/widgets/edit_art_work_download_widget.dart';
import 'package:mobile_fast_ai/src/presentation/screens/home_group/edit_art_work/widgets/edit_art_work_edit_input_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bottom_sheet_provider.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/combined_gridview.dart';
import 'widgets/edit_art_work_generate_image_widget.dart';
import 'widgets/edit_art_work_option_widget.dart';
import 'widgets/edit_art_work_action_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class EditArtWorkScreen extends StatefulWidget {
  // Default view type = 0 , 1 as gridview
  final int viewType;

  // put something argument here
  const EditArtWorkScreen({
    this.viewType = 1,
    super.key,
  });

  @override
  State<EditArtWorkScreen> createState() => _EditArtWorkScreenState();
}

class _EditArtWorkScreenState extends State<EditArtWorkScreen> {
  bool isLoading = true;

  int viewType = 0;

  @override
  void initState() {
    super.initState();
    viewType = widget.viewType;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // fake loading
      await Future.delayed(const Duration(
        seconds: 3,
      ));

      if (context.mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
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
                  LanguageKey.editArtWorkScreenAppBarTitle,
                ),
                actions: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      AppNavigator.push(RoutePath.finalize, {
                        'url': randomDummyImg(),
                      });
                    },
                    child: Text(
                      localization.translate(
                        LanguageKey.editArtWorkScreenFinalize,
                      ),
                      style: AppTypography.heading5Bold.copyWith(
                        color: appTheme.statusColorDisButton,
                      ),
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
                  child: Column(
                    children: [
                      Expanded(
                        child: viewType == 0
                            ? Column(
                                children: [
                                  Expanded(
                                    child: EditArtWorkGenerateImageWidget(
                                      url: randomDummyImg(),
                                      localization: localization,
                                      appTheme: appTheme,
                                      loading: isLoading,
                                      onDownLoad: () {
                                        _downLoad(
                                          appTheme: appTheme,
                                          localization: localization,
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: BoxSize.boxSize05,
                                  ),
                                  Row(
                                    children: List.generate(
                                      4,
                                      (index) {
                                        final String url = dummyImages[index];
                                        return Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: Spacing.spacing03,
                                            ),
                                            child: EditArtWorkBoxImageWidget(
                                              appTheme: appTheme,
                                              localization: localization,
                                              url: url,
                                              loading: isLoading,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )
                            : CombinedGridView(
                                childCount: 2,
                                onRefresh: () {
                                  //
                                },
                                onLoadMore: () {
                                  //
                                },
                                data: List.empty(growable: true)
                                  ..addAll(
                                    dummyImages,
                                  )
                                  ..removeAt(4),
                                builder: (url, _) {
                                  return EditArtWorkGenerateImageWidget(
                                    url: url,
                                    localization: localization,
                                    appTheme: appTheme,
                                    onDownLoad: () {
                                      _downLoad(
                                        appTheme: appTheme,
                                        localization: localization,
                                      );
                                    },
                                    loading: isLoading,
                                  );
                                },
                                canLoadMore: false,
                                childAspectRatio: 1,
                                crossAxisSpacing: Spacing.spacing04,
                                mainAxisSpacing: Spacing.spacing05,
                              ),
                      ),
                      const SizedBox(
                        height: BoxSize.boxSize10,
                      ),
                      EditArtWorkOptionWidget(
                        appTheme: appTheme,
                        localization: localization,
                        selected: viewType,
                        onChangeView: () {
                          setState(() {
                            viewType = 1;
                          });
                        },
                        onPrint: () {
                          setState(() {
                            viewType = 0;
                          });
                        },
                      ),
                      const SizedBox(
                        height: BoxSize.boxSize07,
                      ),
                      EditArtWorkActionWidget(
                        localization: localization,
                        appTheme: appTheme,
                        onEditInputTap: () {
                          _onEdit(
                            appTheme: appTheme,
                            localization: localization,
                          );
                        },
                        onEraseObjectTap: () {
                          AppNavigator.push(
                            RoutePath.eraseObject,
                            {
                              'description':
                                  'You can erase the unwanted part of your artwork, then Artify will redraw it for you.',
                              'url': randomDummyImg(),
                            },
                          );
                        },
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

  void _downLoad({
    required AppTheme appTheme,
    required AppLocalizationManager localization,
  }) async {
    final value = await AppBottomSheetProvider.showMediumBottomSheet(
      context,
      theme: appTheme,
      child: EditArtWorkDownLoadWidget(
        appTheme: appTheme,
        localization: localization,
        downloadOptions: const [
          '512 x 512',
          '1024 x 1024',
          '2048 x 2048',
          '4096 x 4096',
          '8192 x 8192',
        ],
      ),
    );
  }

  void _onEdit({
    required AppTheme appTheme,
    required AppLocalizationManager localization,
  }) async {
    final value = await AppBottomSheetProvider.showHighBottomSheet(
      context,
      theme: appTheme,
      child: EditARtWorkEditInputWidget(
        appTheme: appTheme,
        localization: localization,
        selectedRatio: 1,
        currentCFG: 9,
        maxCFG: 30,
        minCFG: 0,
      ),
    );
  }
}
