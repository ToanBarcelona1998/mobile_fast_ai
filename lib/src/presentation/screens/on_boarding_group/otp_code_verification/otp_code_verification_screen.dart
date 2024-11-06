import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/counter_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/key_board_number_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_box_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/opt_content_widget.dart';

class OtpCodeVerificationScreen extends StatefulWidget {
  final String email;

  const OtpCodeVerificationScreen({
    required this.email,
    super.key,
  });

  @override
  State<OtpCodeVerificationScreen> createState() =>
      _OtpCodeVerificationScreenState();
}

class _OtpCodeVerificationScreenState extends State<OtpCodeVerificationScreen> {
  final List<String> _opts = ['', '', '', ''];

  int _currentIndex = 0;

  bool _countDownDone = false;

  final GlobalKey<CounterWidgetState> _counterWidgetKey = GlobalKey();

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
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Spacing.spacing05,
                          vertical: Spacing.spacing07,
                        ),
                        children: [
                          OtpContentWidget(
                            localization: localization,
                            appTheme: appTheme,
                            email: widget.email,
                          ),
                          Row(
                            children: List.generate(
                              _opts.length,
                              (index) {
                                final String text = _opts[index];
                                return Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: BoxSize.boxSize03,
                                    ),
                                    child: TextBoxWidget(
                                      text: text,
                                      appTheme: appTheme,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: BoxSize.boxSize07,
                          ),
                          Text(
                            localization.translate(
                              LanguageKey
                                  .onBoardingOtpCodeVerificationScreenDidNotReceiveEmail,
                            ),
                            textAlign: TextAlign.center,
                            style: AppTypography.bodyXLargeMedium.copyWith(
                              color: appTheme.greyScaleColor900,
                            ),
                          ),
                          const SizedBox(
                            height: BoxSize.boxSize04,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${localization.translate(
                                  LanguageKey
                                      .onBoardingOtpCodeVerificationScreenResentContent,
                                )} ',
                                style: AppTypography.bodyXLargeMedium.copyWith(
                                  color: appTheme.greyScaleColor900,
                                ),
                              ),
                              Visibility(
                                visible: !_countDownDone,
                                replacement: GestureDetector(
                                  onTap: _onResend,
                                  behavior: HitTestBehavior.opaque,
                                  child: Text(
                                    localization.translate(
                                      LanguageKey
                                          .onBoardingOtpCodeVerificationScreenResent,
                                    ),
                                    style:
                                    AppTypography.bodyXLargeMedium.copyWith(
                                      color: appTheme.primaryColor900,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CounterWidget(
                                      duration: const Duration(
                                        seconds: 2,
                                      ),
                                      textStyle: AppTypography.bodyXLargeMedium
                                          .copyWith(
                                        color: appTheme.primaryColor900,
                                      ),
                                      onCountDownDone: _onCountDownDone,
                                      key: _counterWidgetKey,
                                    ),
                                    Text(
                                      ' s',
                                      style: AppTypography.bodyXLargeMedium
                                          .copyWith(
                                        color: appTheme.greyScaleColor900,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    KeyboardNumberWidget(
                      onKeyboardTap: _onKeyBoardTap,
                      appTheme: appTheme,
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

  void _onKeyBoardTap(String text) {
    if (_currentIndex == _opts.length) {
      // Add some logic verification
      if (true) {
        AppNavigator.replaceWith(
          RoutePath.createNewPassword,
        );
      } else {}
      return;
    }

    _opts[_currentIndex] = text;

    _currentIndex++;

    setState(() {});
  }

  void _onCountDownDone() {
    _countDownDone = true;

    setState(() {});
  }

  void _onResend() {
    // Add some logic resend otp
    _counterWidgetKey.currentState?.setUpCountdown();
  }
}
