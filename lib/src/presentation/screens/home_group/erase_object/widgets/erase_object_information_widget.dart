import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class EraseObjectInformationWidget extends StatelessWidget {
  final String url;
  final String description;
  final AppTheme appTheme;

  const EraseObjectInformationWidget({
    required this.description,
    required this.url,
    required this.appTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NetworkImageWidget(
          imageUrl: url,
          appTheme: appTheme,
          width: double.maxFinite,
          height: context.h * 0.45,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        Text(
          description,
          style: AppTypography.heading6Medium.copyWith(
            color: appTheme.greyScaleColor900,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
