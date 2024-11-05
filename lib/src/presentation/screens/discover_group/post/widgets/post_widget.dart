import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/circle_avatar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/icon_with_text_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/popup_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'post_popup_widget.dart';

class PostWidget extends StatefulWidget {
  final String imgUrl;
  final String postUserName;
  final String avatar;
  final String title;
  final int totalLike;
  final String prompt;
  final String negativePrompt;
  final String cfgScale;
  final String seed;
  final bool liked;
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final VoidCallback onLikeTap;
  final VoidCallback onSendTap;
  final VoidCallback onSaveArtWorkTap;
  final VoidCallback onDownloadArtWorkTap;
  final VoidCallback onReportTap;
  final VoidCallback onRemixTap;

  const PostWidget({
    required this.title,
    required this.cfgScale,
    required this.postUserName,
    required this.imgUrl,
    required this.avatar,
    required this.negativePrompt,
    required this.prompt,
    required this.seed,
    required this.totalLike,
    required this.appTheme,
    required this.localization,
    required this.onLikeTap,
    required this.onSendTap,
    required this.onDownloadArtWorkTap,
    required this.onReportTap,
    required this.onSaveArtWorkTap,
    required this.onRemixTap,
    this.liked = false,
    super.key,
  });

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool isDisplayFull = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FlexibleDualWidgetRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          firstChildWidget: Row(
            children: [
              CircleAvatarWidget(
                url: widget.avatar,
                width: BoxSize.boxSize10,
                height: BoxSize.boxSize10,
              ),
              const SizedBox(
                width: Spacing.spacing04,
              ),
              Text(
                widget.postUserName,
                style: AppTypography.heading5SemiBold.copyWith(
                  color: widget.appTheme.greyScaleColor900,
                ),
              ),
            ],
          ),
          secondChildWidget: PopupMenuWidget(
            appTheme: widget.appTheme,
            children: [
              PopupMenuItem(
                onTap: widget.onSaveArtWorkTap,
                child: PostPopupWidget(
                  appTheme: widget.appTheme,
                  title: widget.localization.translate(
                    LanguageKey.discoverPostScreenSaveArtWork,
                  ),
                  iconPath: AssetIconPath.icCommonBookMark,
                ),
              ),
              PopupMenuItem(
                onTap: widget.onDownloadArtWorkTap,
                child: PostPopupWidget(
                  appTheme: widget.appTheme,
                  title: widget.localization.translate(
                    LanguageKey.discoverPostScreenDownloadArtWork,
                  ),
                  iconPath: AssetIconPath.icCommonDownload,
                ),
              ),
              PopupMenuItem(
                onTap: widget.onReportTap,
                child: PostPopupWidget(
                  appTheme: widget.appTheme,
                  title: widget.localization
                      .translate(LanguageKey.discoverPostScreenReport),
                  iconPath: AssetIconPath.icCommonReport,
                  displayDivider: false,
                ),
              ),
            ],
          ),
          appTheme: widget.appTheme,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        NetworkImageWidget(
          imageUrl: widget.imgUrl,
          appTheme: widget.appTheme,
          width: double.maxFinite,
          height: context.h * 0.4,
        ),
        const SizedBox(
          height: BoxSize.boxSize04,
        ),
        FlexibleDualWidgetRow(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          firstChildWidget: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.liked)
                SvgPicture.asset(
                  AssetIconPath.icCommonLikeActive,
                )
              else
                SvgPicture.asset(
                  AssetIconPath.icCommonLike,
                ),
              const SizedBox(
                width: BoxSize.boxSize04,
              ),
              Text(
                widget.totalLike.toString(),
                style: AppTypography.heading6SemiBold.copyWith(
                  color: widget.appTheme.greyScaleColor900,
                ),
              ),
              const SizedBox(
                width: BoxSize.boxSize06,
              ),
              SvgPicture.asset(
                AssetIconPath.icCommonSend,
              ),
            ],
          ),
          onSecondChildTap: widget.onRemixTap,
          secondChildWidget: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.spacing04,
              vertical: Spacing.spacing02,
            ),
            decoration: BoxDecoration(
              color: widget.appTheme.primaryColor900,
              borderRadius: BorderRadius.circular(
                BorderRadiusSize.borderRadiusRound,
              ),
            ),
            child: Text(
              widget.localization.translate(
                LanguageKey.discoverPostScreenRemix,
              ),
              style: AppTypography.bodyMediumSemiBold.copyWith(
                color: widget.appTheme.otherColorWhite,
              ),
            ),
          ),
          appTheme: widget.appTheme,
        ),
        const SizedBox(
          height: BoxSize.boxSize04,
        ),
        Text(
          widget.title,
          style: AppTypography.heading5Bold.copyWith(
            color: widget.appTheme.greyScaleColor900,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize04,
        ),
        Text(
          widget.localization.translate(
            LanguageKey.discoverPostScreenPrompt,
          ),
          style: AppTypography.bodyXLargeSemiBold.copyWith(
            color: widget.appTheme.greyScaleColor900,
          ),
        ),
        Text(
          widget.prompt,
          style: AppTypography.bodyXLargeRegular.copyWith(
            color: widget.appTheme.greyScaleColor900,
          ),
          maxLines: isDisplayFull ? null : 3,
          overflow: isDisplayFull ? null : TextOverflow.ellipsis,
        ),
        const SizedBox(
          height: BoxSize.boxSize04,
        ),
        if (!isDisplayFull)
          GestureDetector(
            onTap: () {
              setState(() {
                isDisplayFull = !isDisplayFull;
              });
            },
            behavior: HitTestBehavior.opaque,
            child: Text(
              widget.localization.translate(
                LanguageKey.discoverPostScreenMore,
              ),
              style: AppTypography.bodyXLargeSemiBold.copyWith(
                color: widget.appTheme.primaryColor900,
              ),
            ),
          )
        else ...[
          Text(
            widget.localization.translate(
              LanguageKey.discoverPostScreenNegativePrompt,
            ),
            style: AppTypography.bodyXLargeSemiBold.copyWith(
              color: widget.appTheme.greyScaleColor900,
            ),
          ),
          Text(
            widget.negativePrompt,
            style: AppTypography.bodyXLargeRegular.copyWith(
              color: widget.appTheme.greyScaleColor900,
            ),
          ),
          const SizedBox(
            height: BoxSize.boxSize05,
          ),
          FlexibleDualWidgetRow(
            firstChildWidget: IntrinsicHeight(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.localization.translate(
                          LanguageKey.discoverPostScreenSFGScale,
                        ),
                        style: AppTypography.bodyXLargeSemiBold.copyWith(
                          color: widget.appTheme.greyScaleColor900,
                        ),
                      ),
                      const SizedBox(
                        height: BoxSize.boxSize03,
                      ),
                      Text(
                        widget.cfgScale,
                        style: AppTypography.bodyXLargeRegular.copyWith(
                          color: widget.appTheme.greyScaleColor900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: BoxSize.boxSize05,
                  ),
                  VerticalDivider(
                    color: widget.appTheme.greyScaleColor200,
                  ),
                  const SizedBox(
                    width: BoxSize.boxSize05,
                  ),
                ],
              ),
            ),
            secondChildWidget: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.localization.translate(
                    LanguageKey.discoverPostScreenSeed,
                  ),
                  style: AppTypography.bodyXLargeSemiBold.copyWith(
                    color: widget.appTheme.greyScaleColor900,
                  ),
                ),
                const SizedBox(
                  height: BoxSize.boxSize03,
                ),
                Text(
                  widget.seed,
                  style: AppTypography.bodyXLargeRegular.copyWith(
                    color: widget.appTheme.greyScaleColor900,
                  ),
                ),
              ],
            ),
            appTheme: widget.appTheme,
          ),
        ]
      ],
    );
  }
}
