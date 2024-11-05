import 'package:mobile_fast_ai/src/presentation/screens/home_group/home/discover/discover_page.dart';
import 'package:mobile_fast_ai/src/presentation/screens/home_group/home/home_page/home_page.dart';
import 'package:mobile_fast_ai/src/presentation/screens/home_group/home/home_screen.dart';
import 'package:mobile_fast_ai/src/presentation/screens/home_group/home/my_profile/my_profile_page.dart';
import 'package:mobile_fast_ai/src/presentation/screens/home_group/home/tool_box_page/tool_box_page.dart';
import 'package:flutter/material.dart';

class HomeScreenTabBuilder extends StatelessWidget {
  final HomeScreenSection currentSection;
  const HomeScreenTabBuilder({
    required this.currentSection,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildTab(
          HomeScreenSection.home,
          const HomePage(),
        ),
        _buildTab(
          HomeScreenSection.discover,
          const DiscoverPage(),
        ),
        _buildTab(
          HomeScreenSection.toolBox,
          const ToolBoxPage(),
        ),
        _buildTab(
          HomeScreenSection.profile,
          const MyProfilePage(),
        ),
      ],
    );
  }

  Widget _buildTab(HomeScreenSection section, Widget widget) {
    final active = currentSection == section;

    return Positioned.fill(
      child: IgnorePointer(
        ignoring: !active,
        child: AnimatedOpacity(
          opacity: active ? 1 : 0,
          duration: const Duration(
            milliseconds: 200,
          ),
          child: widget,
        ),
      ),
    );
  }
}
