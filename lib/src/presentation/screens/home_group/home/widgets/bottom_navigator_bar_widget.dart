import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
import 'package:mobile_fast_ai/src/application/global/localization/localization_manager.dart';
import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
import 'package:mobile_fast_ai/src/cores/constants/asset_path.dart';
import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigatorBarWidget extends StatefulWidget {
  final AppTheme appTheme; // The app theme
  final AppLocalizationManager localization; // The app localization
  final int currentIndex; // The current selected index
  final void Function(int)
      onTabSelect; // Callback function when a tab is selected

  const BottomNavigatorBarWidget({
    required this.currentIndex,
    required this.appTheme,
    required this.localization,
    required this.onTabSelect,
    super.key,
  });

  @override
  State<BottomNavigatorBarWidget> createState() =>
      _BottomNavigatorBarWidgetState();
}

class _BottomNavigatorBarWidgetState extends State<BottomNavigatorBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: Spacing.spacing05,
        bottom: Spacing.spacing07,
      ), // Padding for the container
      decoration: BoxDecoration(
        color: widget.appTheme.bodyBackGroundColor, // Background color
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            color: Colors.black.withOpacity(0.1), // Shadow color
            blurRadius: 16, // Shadow blur radius
            spreadRadius: 0,
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(
            BorderRadiusSize
                .borderRadius05, // Border radius for top left corner
          ),
          topRight: Radius.circular(
            BorderRadiusSize
                .borderRadius05, // Border radius for top right corner
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _buildItem(
              AssetIconPath.icHomeScreenBottomNavigatorBarHome,
              // Icon path for home tab
              AssetIconPath.icHomeScreenBottomNavigatorBarHomeActive,
              // Active icon path for home tab
              LanguageKey.homeScreenBottomNavigatorBarHomePage,
              // Localization key for home tab label
              () {
                widget.onTabSelect(
                    0); // Callback function when home tab is selected
              },
              widget.currentIndex ==
                  0, // Whether the home tab is currently selected
            ),
          ),
          Expanded(
            child: _buildItem(
              AssetIconPath.icHomeScreenBottomNavigatorBarDiscover,
              // Icon path for home tab
              AssetIconPath.icHomeScreenBottomNavigatorBarDiscoverActive,
              // Active icon path for home tab
              LanguageKey.homeScreenBottomNavigatorBarDiscoverPage,
              // Localization key for home tab label
              () {
                widget.onTabSelect(
                    1); // Callback function when home tab is selected
              },
              widget.currentIndex ==
                  1, // Whether the home tab is currently selected
            ),
          ),
          Expanded(
            child: _buildItem(
              AssetIconPath.icHomeScreenBottomNavigatorBarToolBox,
              // Icon path for history tab
              AssetIconPath.icHomeScreenBottomNavigatorBarToolBoxActive,
              // Active icon path for history tab
              LanguageKey.homeScreenBottomNavigatorBarToolBoxPage,
              // Localization key for history tab label
              () {
                widget.onTabSelect(
                    2); // Callback function when history tab is selected
              },
              widget.currentIndex ==
                  2, // Whether the history tab is currently selected
            ),
          ),
          Expanded(
            child: _buildItem(
              AssetIconPath.icHomeScreenBottomNavigatorBarProfile,
              // Icon path for setting tab
              AssetIconPath.icHomeScreenBottomNavigatorBarProfile,
              // Active icon path for setting tab
              LanguageKey.homeScreenBottomNavigatorBarProfilePage,
              // Localization key for setting tab label
              () {
                widget.onTabSelect(
                    3); // Callback function when setting tab is selected
              },
              widget.currentIndex ==
                  3, // Whether the setting tab is currently selected
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItem(
    String iconPath, // Icon path
    String activeIconPath, // Active icon path
    String labelPath, // Localization key for label
    VoidCallback onTap, // Callback function when the item is tapped
    bool isSelected, // Whether the item is currently selected
  ) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            isSelected
                ? activeIconPath
                : iconPath, // Display active icon if the item is selected, otherwise display normal icon
          ),
          const SizedBox(
            height: BoxSize.boxSize04, // Spacer height
          ),
          Text(
            widget.localization.translate(
              labelPath, // Translate the label using localization provider
            ),
            style: isSelected
                ? AppTypography.bodyXSmallSemiBold.copyWith(
                    color: widget.appTheme
                        .primaryColor900 // Text color for selected item
                    )
                : AppTypography.bodyXSmallMedium.copyWith(
                    color: widget.appTheme.greyScaleColor500, // Text color for item
                  ),
          ),
        ],
      ),
    );
  }
}
