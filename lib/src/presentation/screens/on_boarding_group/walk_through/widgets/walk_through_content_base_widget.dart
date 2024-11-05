import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:flutter/material.dart';

class WalkThroughContentOneWidget extends StatelessWidget {
  final String imgPath;
  final String title;
  final String content;
  final AppTheme appTheme;

  const WalkThroughContentOneWidget({
    required this.imgPath,
    required this.title,
    required this.content,
    required this.appTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image(
            image: AssetImage(
              imgPath,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        appTheme.otherColorWhite.withOpacity(0),
                        appTheme.otherColorWhite.withOpacity(0.5),
                        appTheme.otherColorWhite.withOpacity(0.8),
                        appTheme.otherColorWhite.withOpacity(0.9),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Container(
                color: appTheme.otherColorWhite,
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: AppTypography.heading3Bold.copyWith(
                        color: appTheme.greyScaleColor900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      content,
                      style: AppTypography.bodyXLargeRegular.copyWith(
                        color: appTheme.greyScaleColor900,
                      ),
                      textAlign: TextAlign.center,
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
