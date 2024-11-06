import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/ratio_group_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:flutter/material.dart';

import 'box_color_widget.dart';

class LogoGeneratorContentWidget extends StatelessWidget {
  final AppLocalizationManager localization;
  final AppTheme appTheme;
  final TextEditingController promptController;

  const LogoGeneratorContentWidget({
    required this.appTheme,
    required this.localization,
    required this.promptController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextInputWithBoxFormWidget(
          boxConstraints: const BoxConstraints(
            maxHeight: BoxSize.boxSize16,
            minHeight: BoxSize.boxSize16,
          ),
          hintText: localization.translate(
            LanguageKey.logoGeneratorScreenEnterPromptHint,
          ),
          controller: promptController,
          label: localization.translate(
            LanguageKey.logoGeneratorScreenEnterPrompt,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        TextWithIconWidget(
          title: localization.translate(
            LanguageKey.logoGeneratorScreenRatio,
          ),
          appTheme: appTheme,
          icSvgPath: AssetIconPath.icCommonArrowRightActive,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          onSecondChildTap: () {},
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        RatioGroupWidget(
          appTheme: appTheme,
          selectedValue: 1,
          onChanged: (value) {},
        ),
        TextWithIconWidget(
          title: localization.translate(
            LanguageKey.logoGeneratorScreenBackgroundColor,
          ),
          appTheme: appTheme,
          icSvgPath: AssetIconPath.icCommonArrowRightActive,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          onSecondChildTap: () {},
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          primary: false,
          itemCount: dummyBgColor.length,
          // replace with your data
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            crossAxisSpacing: Spacing.spacing04,
            mainAxisSpacing: Spacing.spacing05,
          ),
          itemBuilder: (context, index) {
            final String hex = dummyBgColor[index];
            return LogoGeneratorBoxColorWidget(
              appTheme: appTheme,
              hex: hex,
              isSelected: index == 0,
              onTap: () {},
            );
          },
        ),
      ],
    );
  }
}
