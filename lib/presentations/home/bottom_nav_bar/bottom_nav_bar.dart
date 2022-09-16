import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:base_project/src/theme/base_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onIndexChange;

  final List<IconData> _bottomBarIcons = [
    Icons.home,
    Icons.search,
    Icons.notifications_none_outlined,
    Icons.mail_outline
  ];
  final List<String> _iconsName = [
    // "Free",
    "Dashboard",
    "Search",
    "Notifications",
    "Inbox"
  ];

  BottomNavBar(
      {super.key, required this.selectedIndex, required this.onIndexChange});

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
        itemCount: _iconsName.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.white : const Color(0xFF333333);
          return
              //   index == 0?Container(
              //   color: Colors.white
              // ):
              Container(
            color: isActive ? BaseTheme.primaryColor : Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _bottomBarIcons[index],
                  size: 20,
                  color: color,
                ),
                const SizedBox(height: 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: AutoSizeText(
                    _iconsName[index].tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    presetFontSizes: const [10, 8],
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: color),
                  ),
                )
              ],
            ),
          );
        },
        leftCornerRadius: 16,
        rightCornerRadius: 16,
        activeIndex: selectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: onIndexChange);
  }
}
