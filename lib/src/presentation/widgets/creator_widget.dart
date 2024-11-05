import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/circle_avatar_widget.dart';
import 'package:flutter/material.dart';

class UserInformationWidget extends StatelessWidget {
  final String avatar;
  final String creatorName;
  final String creatorDescription;
  final AppTheme appTheme;
  final double avatarWidth;
  final double avatarHeight;

  const UserInformationWidget({
    required this.avatar,
    required this.creatorDescription,
    required this.creatorName,
    required this.appTheme,
    this.avatarHeight = BoxSize.boxSize11,
    this.avatarWidth = BoxSize.boxSize11,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatarWidget(
          url: avatar,
          width: avatarWidth,
          height: avatarHeight,
        ),
        const SizedBox(
          width: BoxSize.boxSize04,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                creatorName,
                style: AppTypography.heading6Bold.copyWith(
                  color: appTheme.greyScaleColor900,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: BoxSize.boxSize03,
              ),
              Text(
                creatorDescription,
                style: AppTypography.bodyMediumMedium.copyWith(
                  color: appTheme.greyScaleColor700,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
