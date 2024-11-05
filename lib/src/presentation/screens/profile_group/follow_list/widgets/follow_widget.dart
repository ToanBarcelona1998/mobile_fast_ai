import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/creator_widget.dart';
import 'package:flutter/material.dart';

abstract class _FollowListFlWidget extends StatelessWidget {
  final String avatar;
  final String name;
  final String description;
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final VoidCallback onTap;
  final VoidCallback onFollowTap;
  final bool followed;

  const _FollowListFlWidget({
    required this.avatar,
    required this.description,
    required this.name,
    required this.appTheme,
    required this.localization,
    required this.onTap,
    required this.onFollowTap,
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
              creatorDescription: description,
              creatorName: name,
              appTheme: appTheme,
            ),
          ),
        ),
        const SizedBox(
          width: BoxSize.boxSize04,
        ),
        actionBuild(context),
      ],
    );
  }

  Widget actionBuild(BuildContext context);
}

class FollowListFollowerWidget extends _FollowListFlWidget {
  const FollowListFollowerWidget({
    required super.avatar,
    required super.description,
    required super.name,
    required super.appTheme,
    required super.localization,
    required super.onTap,
    required super.onFollowTap,
    super.followed = false,
    super.key,
  });

  @override
  Widget actionBuild(BuildContext context) {
    return GestureDetector(
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
                  LanguageKey.followListScreenFollowing,
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
    );
  }
}

class FollowListFollowingWidget extends _FollowListFlWidget {
  const FollowListFollowingWidget({
    required super.avatar,
    required super.description,
    required super.name,
    required super.appTheme,
    required super.localization,
    required super.onTap,
    required super.onFollowTap,
    super.followed = false,
    super.key,
  });

  @override
  Widget actionBuild(BuildContext context) {
    return GestureDetector(
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
                  LanguageKey.followListScreenUnFollow,
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
    );
  }
}
