import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class ExplorePromptDetailWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final String description;
  final String imgUrl;
  final VoidCallback onTryClick;

  const ExplorePromptDetailWidget({
    required this.appTheme,
    required this.localization,
    required this.imgUrl,
    required this.description,
    required this.onTryClick,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        Spacing.spacing07,
      ),
      decoration: BoxDecoration(
        color: appTheme.bodyBackGroundColor,
        borderRadius: BorderRadius.circular(
          BorderRadiusSize.borderRadius05,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NetworkImageWidget(
            imageUrl: imgUrl,
            appTheme: appTheme,
            height: context.h * 0.46,
            width: double.maxFinite,
          ),
          const SizedBox(
            height: BoxSize.boxSize05,
          ),
          Text(
            description,
            style: AppTypography.heading6Medium.copyWith(
              color: appTheme.greyScaleColor900,
            ),
          ),
          const SizedBox(
            height: BoxSize.boxSize05,
          ),
          PrimaryAppButton(
            text: localization.translate(
              LanguageKey.explorePromptScreenTry,
            ),
            onPress: (){
              AppNavigator.pop();
              onTryClick.call();
            },
          ),
        ],
      ),
    );
  }
}
