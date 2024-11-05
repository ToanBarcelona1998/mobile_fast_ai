import 'package:mobile_fast_ai/src/application/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/combine_list_view.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/dialog_provider_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/radio_widget.dart';
import 'package:flutter/material.dart';

class DiscoverReportScreen extends StatefulWidget {
  // Change with your arguments
  final int postId;

  const DiscoverReportScreen({
    required this.postId,
    super.key,
  });

  @override
  State<DiscoverReportScreen> createState() => _DiscoverReportScreenState();
}

class _DiscoverReportScreenState extends State<DiscoverReportScreen> {
  int _group = -1;

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
                title: localization.translate(
                  LanguageKey.postReportScreenAppBarTitle,
                ),
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Spacing.spacing07,
                    horizontal: Spacing.spacing05,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localization.translate(
                          LanguageKey.postReportScreenReason,
                        ),
                        style: AppTypography.heading5SemiBold.copyWith(
                          color: appTheme.greyScaleColor900,
                        ),
                      ),
                      const SizedBox(
                        height: BoxSize.boxSize05,
                      ),
                      Expanded(
                        child: CombinedListView(
                          onRefresh: () {
                            //
                          },
                          onLoadMore: () {
                            //
                          },
                          data: const [
                            'Offensive or Inappropriate Content',
                            'Fraud or Scam',
                            'Nudity or Pornography',
                            'Harmful or Dangerous Content',
                            'Hateful Activities',
                            'Safety Concerns',
                            'Counterfeit or Fake Artwork',
                            'Cultural Appropriation',
                            'Violation of Guidelines or Policies',
                            'Hateful Activities',
                            'Other',
                          ],
                          builder: (reason, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                bottom: Spacing.spacing07,
                              ),
                              child: RadioWidget<int>(
                                label: reason,
                                appTheme: appTheme,
                                value: index,
                                group: _group,
                                onChanged: (value) {
                                  setState(() {
                                    _group = value;
                                  });
                                },
                              ),
                            );
                          },
                          canLoadMore: false,
                        ),
                      ),
                      PrimaryAppButton(
                        text: localization.translate(
                          LanguageKey.postReportScreenButtonTitle,
                        ),
                        onPress: () {
                          _onReportSuccessful(
                            appTheme: appTheme,
                            localization: localization,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _onReportSuccessful({
    required AppTheme appTheme,
    required AppLocalizationManager localization,
  }) {
    DialogProvider.showSuccessfulDialog(
      context,
      content: localization.translate(
        LanguageKey.postReportScreenSuccessfulContent,
      ),
      title: localization.translate(
        LanguageKey.postReportScreenSuccessfulTitle,
      ),
      appTheme: appTheme,
      bottomWidgetBuilder: (context, appTheme) {
        return PrimaryAppButton(
          text: localization.translate(
            LanguageKey.postReportScreenSuccessfulButtonTitle,
          ),
          onPress: () {
            AppNavigator.pop();
          },
        );
      },
    );
  }
}
