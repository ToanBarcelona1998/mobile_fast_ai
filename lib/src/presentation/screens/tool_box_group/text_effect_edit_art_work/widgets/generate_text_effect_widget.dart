import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/cores/constants/dummy_data.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_loading_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class TextEffectEditArtWorkGenerateWidget extends StatelessWidget {
  final AppTheme appTheme;
  final bool isLoading;

  const TextEffectEditArtWorkGenerateWidget({
    required this.appTheme,
    this.isLoading = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TextEffectArtEditArtWorkGenerateImageWidget(
          url: dummyTextEffect[0],
          appTheme: appTheme,
          loading: isLoading,
          onDownLoad: () {},
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        Row(
          children: List.generate(
            4,
            (index) {
              final String url = dummyTextEffect[index];
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.spacing03,
                  ),
                  child: _TextEffectEditArtWorkBoxImageWidget(
                    appTheme: appTheme,
                    url: url,
                    loading: isLoading,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        HoLiZonTalDividerWidget(
          appTheme: appTheme,
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
      ],
    );
  }
}

class _TextEffectArtEditArtWorkGenerateImageWidget extends StatelessWidget {
  final bool loading;
  final String url;
  final AppTheme appTheme;
  final VoidCallback onDownLoad;

  const _TextEffectArtEditArtWorkGenerateImageWidget({
    this.loading = true,
    required this.url,
    required this.appTheme,
    required this.onDownLoad,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h * 0.45,
      decoration: BoxDecoration(
        color: appTheme.greyScaleColor100,
        borderRadius: BorderRadius.circular(
          BorderRadiusSize.borderRadius05,
        ),
      ),
      alignment: Alignment.center,
      child: loading
          ? Center(
              child: AppLoadingWidget(
                appTheme: appTheme,
              ),
            )
          : NetworkImageWidget(
              imageUrl: url,
              appTheme: appTheme,
              width: double.maxFinite,
              height: double.maxFinite,
            ),
    );
  }
}

class _TextEffectEditArtWorkBoxImageWidget extends StatelessWidget {
  final bool loading;
  final String url;
  final AppTheme appTheme;

  const _TextEffectEditArtWorkBoxImageWidget({
    this.loading = true,
    required this.url,
    required this.appTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: BoxSize.boxSize12,
      decoration: BoxDecoration(
        color: appTheme.greyScaleColor100,
        borderRadius: BorderRadius.circular(
          BorderRadiusSize.borderRadius03,
        ),
      ),
      child: loading
          ? const SizedBox.shrink()
          : NetworkImageWidget(
              imageUrl: url,
              appTheme: appTheme,
            ),
    );
  }
}
