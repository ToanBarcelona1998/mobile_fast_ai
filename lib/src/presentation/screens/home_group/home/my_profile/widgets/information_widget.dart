import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/helpers/int_format.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/creator_widget.dart';
import 'package:flutter/material.dart';

class MyProfileInformationWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final String avatar;
  final String userName;
  final String description;
  final int artWork;
  final int followers;
  final int following;
  final VoidCallback onEdit;

  const MyProfileInformationWidget({
    required this.appTheme,
    required this.description,
    required this.localization,
    required this.userName,
    required this.avatar,
    required this.onEdit,
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
                creatorDescription: description,
                creatorName: userName,
                appTheme: appTheme,
              ),
            ),
            const SizedBox(
              width: BoxSize.boxSize04,
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: onEdit,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: Spacing.spacing03,
                  horizontal: Spacing.spacing04,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      BorderRadiusSize.borderRadiusRound,
                    ),
                    border: Border.all(
                      color: appTheme.primaryColor900,
                    )),
                child: Text(
                  localization.translate(
                    LanguageKey.userProfileScreenEditProfile,
                  ),
                  style: AppTypography.bodyMediumSemiBold.copyWith(
                    color: appTheme.primaryColor900,
                  ),
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
                        LanguageKey.userProfileScreenArtWork,
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
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    AppNavigator.push(
                      RoutePath.followList,
                    );
                  },
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
                          LanguageKey.userProfileScreenFollowers,
                        ),
                        style: AppTypography.bodyLargeMedium.copyWith(
                          color: appTheme.greyScaleColor700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              VerticalDivider(
                color: appTheme.greyScaleColor200,
              ),
              Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    AppNavigator.push(
                      RoutePath.followList,
                    );
                  },
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
                          LanguageKey.userProfileScreenFollowing,
                        ),
                        style: AppTypography.bodyLargeMedium.copyWith(
                          color: appTheme.greyScaleColor700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
