import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'widgets/bottom_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class AvatarGeneratorDownloadScreen extends StatefulWidget {
  final String url;

  const AvatarGeneratorDownloadScreen({
    required this.url,
    super.key,
  });

  @override
  State<AvatarGeneratorDownloadScreen> createState() =>
      _AvatarGeneratorDownloadScreenState();
}

class _AvatarGeneratorDownloadScreenState
    extends State<AvatarGeneratorDownloadScreen> {
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
                actions: [
                  GestureDetector(
                    onTap: () {
                      AppNavigator.push(
                        RoutePath.avatarGeneratorFinalize,
                        widget.url,
                      );
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.spacing05,
                      ),
                      child: Text(
                        localization.translate(
                          LanguageKey.aiAvatarDownloadScreenFinalize,
                        ),
                        style: AppTypography.heading5Bold.copyWith(
                          color: appTheme.primaryColor900,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: Spacing.spacing07,
                          horizontal: Spacing.spacing05,
                        ),
                        child: Center(
                          child: NetworkImageWidget(
                            imageUrl: widget.url,
                            appTheme: appTheme,
                            width: double.maxFinite,
                            height: context.h * 0.45,
                          ),
                        ),
                      ),
                    ),
                    AvatarGeneratorDownloadBottomWidget(
                      appTheme: appTheme,
                      localization: localization,
                      onShare: () {},
                      onDownload: () {},
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
