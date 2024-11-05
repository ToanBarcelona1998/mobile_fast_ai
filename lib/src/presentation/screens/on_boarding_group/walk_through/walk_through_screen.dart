import 'package:mobile_fast_ai/src/application/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/presentation/app_navigator.dart';
import 'package:mobile_fast_ai/src/presentation/screens/on_boarding_group/walk_through/widgets/walk_through_content_base_widget.dart';
import 'widgets/bottom_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({super.key});

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  late PageController _pageController;

  int currentPage = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(
      builder: (appTheme) {
        return AppLocalizationProvider(
          builder: (localization) {
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 24,
                          horizontal: 12,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: PageView(
                                controller: _pageController,
                                scrollDirection: Axis.horizontal,
                                onPageChanged: _onPageChanged,
                                children: [
                                  WalkThroughContentOneWidget(
                                    imgPath: AssetImagePath.imgWalkThrough1,
                                    title: localization.translate(
                                      LanguageKey
                                          .onBoardingWalkThroughScreenFirstPageTitle,
                                    ),
                                    content: localization.translate(
                                      LanguageKey
                                          .onBoardingWalkThroughScreenFirstPageContent,
                                    ),
                                    appTheme: appTheme,
                                  ),
                                  WalkThroughContentOneWidget(
                                    imgPath: AssetImagePath.imgWalkThrough2,
                                    title: localization.translate(
                                      LanguageKey
                                          .onBoardingWalkThroughScreenSecondPageTitle,
                                    ),
                                    content: localization.translate(
                                      LanguageKey
                                          .onBoardingWalkThroughScreenSecondPageContent,
                                    ),
                                    appTheme: appTheme,
                                  ),
                                  WalkThroughContentOneWidget(
                                    imgPath: AssetImagePath.imgWalkThrough3,
                                    title: localization.translate(
                                      LanguageKey
                                          .onBoardingWalkThroughScreenThirdPageTitle,
                                    ),
                                    content: localization.translate(
                                      LanguageKey
                                          .onBoardingWalkThroughScreenThirdPageContent,
                                    ),
                                    appTheme: appTheme,
                                  ),
                                ],
                              ),
                            ),
                            SmoothPageIndicator(
                              controller: _pageController,
                              count: 3,
                              axisDirection: Axis.horizontal,
                              effect: ExpandingDotsEffect(
                                activeDotColor: appTheme.primaryColor900,
                                dotColor: appTheme.greyScaleColor300,
                                dotHeight: 12,
                                dotWidth: 12,
                                radius: 100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    BottomFormWidget(
                      appTheme: appTheme,
                      localization: localization,
                      onNext: _onNext,
                      onSkip: _onSkip,
                      onGetStarted: _onGetStarted,
                      isEndWalkThrough: currentPage == 2,
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

  void _onSkip() {
    _pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _onNext() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int page) {
    currentPage = page;
    setState(() {});
  }

  void _onGetStarted() {
    AppNavigator.replaceWith(
      RoutePath.welcome,
    );
  }
}
