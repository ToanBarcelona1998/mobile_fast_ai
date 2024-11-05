import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/helpers/int_format.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/creator_widget.dart';
import 'package:flutter/material.dart';

class CreatorInformationWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final String avatar;
  final String creatorName;
  final String creatorDescription;
  final bool followed;
  final int artWork;
  final int followers;
  final int following;

  const CreatorInformationWidget({
    required this.appTheme,
    required this.creatorDescription,
    this.followed = false,
    required this.localization,
    required this.creatorName,
    required this.avatar,
    this.artWork = 0,
    this.followers = 0,
    this.following = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: UserInformationWidget(
                avatar: avatar,
                creatorDescription: creatorDescription,
                creatorName: creatorName,
                appTheme: appTheme,
              ),
            ),
            const SizedBox(
              width: BoxSize.boxSize04,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: Spacing.spacing03,
                horizontal: Spacing.spacing04,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  BorderRadiusSize.borderRadiusRound,
                ),
                color: followed ? null : appTheme.primaryColor900,
                border: followed
                    ? Border.all(
                        color: appTheme.primaryColor900,
                      )
                    : null,
              ),
              child: followed
                  ? Text(
                      localization.translate(
                        LanguageKey.creatorDetailScreenFollowing,
                      ),
                      style: AppTypography.bodyMediumSemiBold.copyWith(
                        color: appTheme.primaryColor900,
                      ),
                    )
                  : Text(
                      localization.translate(
                        LanguageKey.creatorDetailScreenFollow,
                      ),
                      style: AppTypography.bodyMediumSemiBold.copyWith(
                        color: appTheme.otherColorWhite,
                      ),
                    ),
            ),
          ],
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      artWork.formatCount,
                      style: AppTypography.heading4Bold.copyWith(
                        color: appTheme.greyScaleColor900,
                      ),
                    ),
                    const SizedBox(
                      height: BoxSize.boxSize03,
                    ),
                    Text(
                      localization.translate(
                        LanguageKey.creatorDetailScreenArtWork,
                      ),
                      style: AppTypography.bodyLargeMedium.copyWith(
                        color: appTheme.greyScaleColor700,
                      ),
                    ),
                  ],
                ),
              ),
              VerticalDivider(
                color: appTheme.greyScaleColor200,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      followers.formatCount,
                      style: AppTypography.heading4Bold.copyWith(
                        color: appTheme.greyScaleColor900,
                      ),
                    ),
                    const SizedBox(
                      height: BoxSize.boxSize03,
                    ),
                    Text(
                      localization.translate(
                        LanguageKey.creatorDetailScreenFollowers,
                      ),
                      style: AppTypography.bodyLargeMedium.copyWith(
                        color: appTheme.greyScaleColor700,
                      ),
                    ),
                  ],
                ),
              ),
              VerticalDivider(
                color: appTheme.greyScaleColor200,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      following.formatCount,
                      style: AppTypography.heading4Bold.copyWith(
                        color: appTheme.greyScaleColor900,
                      ),
                    ),
                    const SizedBox(
                      height: BoxSize.boxSize03,
                    ),
                    Text(
                      localization.translate(
                        LanguageKey.creatorDetailScreenFollowing,
                      ),
                      style: AppTypography.bodyLargeMedium.copyWith(
                        color: appTheme.greyScaleColor700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
