import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_base.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/text_input_base/text_input_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: Spacing.spacing07,
                    horizontal: Spacing.spacing05,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            Text(
                              localization.translate(
                                LanguageKey.onBoardingResetPasswordScreenTitle,
                              ),
                              style: AppTypography.heading3Bold.copyWith(
                                color: appTheme.greyScaleColor900,
                              ),
                            ),
                            const SizedBox(
                              height: BoxSize.boxSize04,
                            ),
                            Text(
                              localization.translate(
                                LanguageKey
                                    .onBoardingResetPasswordScreenContent,
                              ),
                              style: AppTypography.bodyXLargeRegular.copyWith(
                                color: appTheme.greyScaleColor900,
                              ),
                            ),
                            const SizedBox(
                              height: BoxSize.boxSize07,
                            ),
                            NormalTextInputWidget(
                              controller: _emailController,
                              hintText: localization.translate(
                                LanguageKey
                                    .onBoardingResetPasswordScreenEmailHint,
                              ),
                              label: localization.translate(
                                LanguageKey.onBoardingResetPasswordScreenEmail,
                              ),
                              constraintManager: ConstraintManager()
                                ..email(
                                  errorMessage: localization.translate(''),
                                ),
                              suffix: SvgPicture.asset(
                                AssetIconPath.icCommonEmail,
                              ),
                            ),
                          ],
                        ),
                      ),
                      PrimaryAppButton(
                        text: localization.translate(
                          LanguageKey.onBoardingResetPasswordScreenContinue,
                        ),
                        onPress: _onContinue,
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

  void _onContinue() {
    AppNavigator.push(
      RoutePath.otpCodeVerification,
      _emailController.text.trim(),
    );
  }
}
