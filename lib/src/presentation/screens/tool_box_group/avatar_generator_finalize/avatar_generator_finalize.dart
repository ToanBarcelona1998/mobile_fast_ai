import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:flutter/material.dart';
import 'widgets/bottom_widget.dart';

class AvatarGeneratorFinalizeScreen extends StatefulWidget {
  final String url;

  const AvatarGeneratorFinalizeScreen({
    required this.url,
    super.key,
  });

  @override
  State<AvatarGeneratorFinalizeScreen> createState() =>
      _AvatarGeneratorFinalizeScreenState();
}

class _AvatarGeneratorFinalizeScreenState
    extends State<AvatarGeneratorFinalizeScreen> {
  final TextEditingController _addTitleController = TextEditingController();

  @override
  void dispose() {
    _addTitleController.dispose();
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
                  LanguageKey.aiAvatarFinalizeScreenAppBarTitle,
                ),
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                          vertical: Spacing.spacing07,
                          horizontal: Spacing.spacing05,
                        ),
                        children: [
                          NetworkImageWidget(
                            imageUrl: widget.url,
                            appTheme: appTheme,
                            width: double.maxFinite,
                            height: context.h * 0.45,
                          ),
                          const SizedBox(
                            height: BoxSize.boxSize05,
                          ),
                          TextInputWithBoxFormWidget(
                            controller: _addTitleController,
                            label: localization.translate(
                              LanguageKey.aiAvatarFinalizeScreenAddTitle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AvatarGeneratorFinalizeBottomWidget(
                      appTheme: appTheme,
                      localization: localization,
                      onShareToFeed: () {},
                      onDownloadArt: () {},
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
