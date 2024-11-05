import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/screens/profile_group/language/widgets/language_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/combine_list_view.dart';
import 'package:flutter/material.dart';

class LanguagesWidget extends StatelessWidget {
  final AppTheme appTheme;
  final AppLocalizationManager localization;
  final List<String> languages;

  const LanguagesWidget({
    required this.appTheme,
    required this.localization,
    this.languages = const [],
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization.translate(
            LanguageKey.languageScreenLanguage,
          ),
          style: AppTypography.heading6Bold.copyWith(
            color: appTheme.greyScaleColor600,
          ),
        ),
        const SizedBox(
          height: BoxSize.boxSize05,
        ),
        Expanded(
          child: CombinedListView(
            onRefresh: () {},
            onLoadMore: () {},
            data: languages,
            builder: (language, _) {
              return LanguageWidget(
                appTheme: appTheme,
                text: language,
              );
            },
            canLoadMore: false,
          ),
        ),
      ],
    );
  }
}
