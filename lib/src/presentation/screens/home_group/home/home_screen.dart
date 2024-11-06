import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme_builder.dart';
import 'package:mobile_fast_ai/src/application/global/localization/app_localization_provider.dart';
import 'package:mobile_fast_ai/src/presentation/screens/home_group/home/widgets/tab_builder.dart';
import 'widgets/bottom_navigator_bar_widget.dart';
import 'package:flutter/material.dart';

enum HomeScreenSection {
  home,
  discover,
  toolBox,
  profile,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenSection currentSection;

  @override
  void initState() {
    currentSection = HomeScreenSection.home;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppThemeBuilder(builder: (appTheme) {
      return AppLocalizationProvider(builder: (localization) {
        return Scaffold(
          body: HomeScreenTabBuilder(
            currentSection: currentSection,
          ),
          bottomNavigationBar: BottomNavigatorBarWidget(
            currentIndex: currentSection.index,
            appTheme: appTheme,
            localization: localization,
            onTabSelect: (index) {
              // Handle tab selection and update the current section
              final HomeScreenSection newSection =
                  HomeScreenSection.values[index];

              if (currentSection == newSection) {
                return;
              }
              setState(() {
                currentSection = newSection;
              });
            },
          ),
        );
      });
    });
  }
}
