import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/screens/tool_box_group/extend_image_edit_art_work/widgets/ratio_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'widgets/bottom_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class ExtendImageEditArtWorkScreen extends StatefulWidget {
  final int width;
  final int height;

  const ExtendImageEditArtWorkScreen({
    required this.width,
    required this.height,
    super.key,
  });

  @override
  State<ExtendImageEditArtWorkScreen> createState() =>
      _ExtendImageEditArtWorkScreenState();
}

class _ExtendImageEditArtWorkScreenState
    extends State<ExtendImageEditArtWorkScreen> {
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  @override
  void initState() {
    _widthController.text = widget.width.toString();
    _heightController.text = widget.height.toString();
    super.initState();
  }

  @override
  void dispose() {
    _widthController.dispose();
    _heightController.dispose();
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
                  LanguageKey.extendImageEditArtWorkScreenAppBarTitle,
                ),
                actions: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      AppNavigator.push(
                        RoutePath.extendImageFinalize,
                        randomDummyImg(),
                      );
                    },
                    child: Text(
                      localization.translate(
                        LanguageKey.extendImageEditArtWorkScreenFinalize,
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
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: Spacing.spacing07,
                            horizontal: Spacing.spacing05,
                          ),
                          child: Column(
                            children: [
                              NetworkImageWidget(
                                imageUrl: randomDummyImg(),
                                appTheme: appTheme,
                                width: double.maxFinite,
                                height: context.h * 0.3,
                              ),
                              const SizedBox(
                                height: BoxSize.boxSize05,
                              ),
                              ExtendImageEditArtWorkRatioWidget(
                                localization: localization,
                                appTheme: appTheme,
                                heightController: _heightController,
                                widthController: _widthController,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ExtendImageEditArtWorkBottomWidget(
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
