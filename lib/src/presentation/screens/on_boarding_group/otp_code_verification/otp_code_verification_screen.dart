import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_fast_ai/config/di.dart';
import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/cores/utils/dart_core_extension.dart';
import 'package:mobile_fast_ai/src/cores/utils/flutter_toast.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'otp_code_verification_selector.dart';
import 'otp_code_verification_state.dart';
import 'otp_code_verification_bloc.dart';
import 'otp_code_verification_event.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/base_screen.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/counter_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/key_board_number_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_box_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/opt_content_widget.dart';

class OtpCodeVerificationScreen extends StatefulWidget {
  final String email;
  final void Function() call;

  const OtpCodeVerificationScreen({
    required this.email,
    required this.call,
    super.key,
  });

  @override
  State<OtpCodeVerificationScreen> createState() =>
      _OtpCodeVerificationScreenState();
}

class _OtpCodeVerificationScreenState extends State<OtpCodeVerificationScreen>
    with StateFulBaseScreen  , CustomFlutterToast{
  late OtpCodeVerificationBloc _bloc;

  bool _countDownDone = false;

  final GlobalKey<CounterWidgetState> _counterWidgetKey = GlobalKey();

  @override
  void initState() {
    _bloc = getIt.get<OtpCodeVerificationBloc>(
      param1: widget.email,
    );
    super.initState();
  }

  void _onKeyBoardTap(String number) {
    _bloc.add(
      OtpCodeVerificationOnChangeCodeEvent(
        number,
      ),
    );
  }

  void _onClear() {
    _bloc.add(
      const OtpCodeVerificationOnDeleteEvent(),
    );
  }

  void _onCountDownDone() {
    _countDownDone = true;

    setState(() {});
  }

  void _onResend() {
    // Add some logic resend otp
    _counterWidgetKey.currentState?.setUpCountdown();
  }

  @override
  Widget child(BuildContext context, AppTheme appTheme,
      AppLocalizationManager localization) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: defaultPadding(),
              child: Column(
                children: [
                  OtpContentWidget(
                    localization: localization,
                    appTheme: appTheme,
                    email: widget.email,
                  ),
                  Row(
                    children: List.generate(
                      6,
                      (index) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: BoxSize.boxSize02,
                            ),
                            child: OtpCodeVerificationCodesSelector(
                                builder: (codes) {
                              final String text =
                                  codes.valueOrNullAtIndex(index) ?? '';
                              return TextBoxWidget(
                                text: text,
                                appTheme: appTheme,
                              );
                            }),
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
                            style: AppTypography.bodyXLargeMedium.copyWith(
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
                              textStyle:
                                  AppTypography.bodyXLargeMedium.copyWith(
                                color: appTheme.primaryColor900,
                              ),
                              onCountDownDone: _onCountDownDone,
                              key: _counterWidgetKey,
                            ),
                            Text(
                              ' s',
                              style: AppTypography.bodyXLargeMedium.copyWith(
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
          ),
        ),
        KeyboardNumberWidget(
          onKeyboardTap: _onKeyBoardTap,
          appTheme: appTheme,
          rightButtonFn: _onClear,
        ),
      ],
    );
  }

  @override
  Widget wrapBuild(BuildContext context, Widget child, AppTheme appTheme,
      AppLocalizationManager localization) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocListener<OtpCodeVerificationBloc, OtpCodeVerificationState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: _onListenStateChange,
        child: Scaffold(
          backgroundColor: appTheme.bodyBackGroundColor,
          appBar: NormalAppBar(
            appTheme: appTheme,
          ),
          body: child,
        ),
      ),
    );
  }

  @override
  EdgeInsets? padding() {
    return EdgeInsets.zero;
  }

  void _onListenStateChange(
      BuildContext context, OtpCodeVerificationState state) {
    switch (state.status) {
      case OtpCodeVerificationStatus.none:
        break;
      case OtpCodeVerificationStatus.checking:
        showLoading();
        break;
      case OtpCodeVerificationStatus.success:
        hideLoading();

        widget.call();
        break;
      case OtpCodeVerificationStatus.failed:

        showToast(state.error ?? '');

        hideLoading();
        break;
    }
  }
}
