import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:mobile_fast_ai/src/presentation/screens/profile_group/follow_us/widgets/follow_us_widget.dart';
import 'package:mobile_fast_ai/src/presentation/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

class FollowUsScreen extends StatefulWidget {
  const FollowUsScreen({super.key});

  @override
  State<FollowUsScreen> createState() => _FollowUsScreenState();
}

class _FollowUsScreenState extends State<FollowUsScreen> {
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
                  LanguageKey.followUsScreenAppBarTitle,
                ),
              ),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Spacing.spacing05,
                      vertical: Spacing.spacing07,
                    ),
                    child: Column(
                      children: [
                        FollowUsWidget(
                          appTheme: appTheme,
                          text: localization.translate(
                            LanguageKey.followUsScreenTwitter,
                          ),
                          icPath: AssetIconPath.icFollowUsTwitter,
                          onTap: () {},
                          backGroundColor: const Color(
                            0xff1D9BF0,
                          ),
                        ),
                        FollowUsWidget(
                          appTheme: appTheme,
                          text: localization.translate(
                            LanguageKey.followUsScreenInstagram,
                          ),
                          icPath: AssetIconPath.icFollowUsIg,
                          onTap: () {},
                          backGroundColor: const Color(
                            0xffEA1E61,
                          ),
                        ),
                        FollowUsWidget(
                          appTheme: appTheme,
                          text: localization.translate(
                            LanguageKey.followUsScreenDiscord,
                          ),
                          icPath: AssetIconPath.icFollowUsDiscord,
                          onTap: () {},
                          backGroundColor: const Color(
                            0xff5869EB,
                          ),
                        ),
                        FollowUsWidget(
                          appTheme: appTheme,
                          text: localization.translate(
                            LanguageKey.followUsScreenReddit,
                          ),
                          icPath: AssetIconPath.icFollowUsReddit,
                          onTap: () {},
                          backGroundColor: const Color(
                            0xffFF4500,
                          ),
                        ),
                        FollowUsWidget(
                          appTheme: appTheme,
                          text: localization.translate(
                            LanguageKey.followUsScreenTelegram,
                          ),
                          icPath: AssetIconPath.icFollowUsTelegram,
                          onTap: () {},
                          backGroundColor: const Color(
                            0xff1C9DD9,
                          ),
                        ),
                        FollowUsWidget(
                          appTheme: appTheme,
                          text: localization.translate(
                            LanguageKey.followUsScreenYoutube,
                          ),
                          icPath: AssetIconPath.icFollowUsYoutube,
                          onTap: () {},
                          backGroundColor: const Color(
                            0xffEE2E24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
