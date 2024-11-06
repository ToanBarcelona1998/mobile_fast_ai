import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'widgets/bottom_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class BatchArtGeneratorDetailScreen extends StatefulWidget {
  final String url;

  const BatchArtGeneratorDetailScreen({
    required this.url,
    super.key,
  });

  @override
  State<BatchArtGeneratorDetailScreen> createState() =>
      _BatchArtGeneratorDetailScreenState();
}

class _BatchArtGeneratorDetailScreenState
    extends State<BatchArtGeneratorDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (appTheme) {
        return AppLocalizationProvider(
          builder: (localization) {
            return Scaffold(
              appBar: NormalAppBar(
                appTheme: appTheme,
                actions: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      AppNavigator.push(
                        RoutePath.batchArtGeneratorFinalize,
                        widget.url,
                      );
                    },
                    child: Text(
                      localization.translate(
                        LanguageKey.batchArtGeneratorDetailScreenFinalize,
                      ),
                      style: AppTypography.heading5Bold.copyWith(
                        color: appTheme.statusColorDisButton,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: BoxSize.boxSize05,
                  ),
                ],
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Spacing.spacing05,
                          vertical: Spacing.spacing07,
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
                    BatchArtGeneratorDetailBottomWidget(
                      appTheme: appTheme,
                      localization: localization,
                      onDownload: () {},
                      onShare: () {},
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
