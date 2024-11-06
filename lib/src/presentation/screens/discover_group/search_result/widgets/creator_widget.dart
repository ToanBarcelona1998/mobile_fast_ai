import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/creator_widget.dart';
import 'package:flutter/material.dart';

class DiscoverSearchResultCreatorWidget extends StatelessWidget {
  final String avatar;
  final String creatorName;
  final String creatorDescription;
  final bool followed;
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final VoidCallback onFollowTap;
  final VoidCallback onTap;

  const DiscoverSearchResultCreatorWidget({
    required this.avatar,
    required this.creatorDescription,
    required this.creatorName,
    required this.appTheme,
    required this.localization,
    required this.onFollowTap,
    required this.onTap,
    this.followed = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onTap,
            child: UserInformationWidget(
              avatar: avatar,
              creatorDescription: creatorDescription,
              creatorName: creatorName,
              appTheme: appTheme,
            ),
          ),
        ),
        const SizedBox(
          width: BoxSize.boxSize04,
        ),
        GestureDetector(
          onTap: onFollowTap,
          behavior: HitTestBehavior.opaque,
          child: Container(
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
                      LanguageKey.searchPostResultScreenFollowing,
                    ),
                    style: AppTypography.bodyMediumSemiBold.copyWith(
                      color: appTheme.primaryColor900,
                    ),
                  )
                : Text(
                    localization.translate(
                      LanguageKey.searchPostResultScreenFollow,
                    ),
                    style: AppTypography.bodyMediumSemiBold.copyWith(
                      color: appTheme.otherColorWhite,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
