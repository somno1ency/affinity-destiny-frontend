import 'package:flutter/material.dart';

import '../../model/shared/navigation_menu.dart';

class AppBottomBar extends StatelessWidget {
  final int currentIndex;
  final List<NavigationMenu> menus;
  final ValueChanged<int>? callback;

  const AppBottomBar({
    super.key,
    this.callback,
    this.currentIndex = 0,
    required this.menus,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: callback,
      currentIndex: currentIndex,
      iconSize: 22,
      items: menus.map(_buildItemByMenuMeta).toList(),
    );
  }

  BottomNavigationBarItem _buildItemByMenuMeta(NavigationMenu menu) {
    return BottomNavigationBarItem(
      label: menu.label,
      icon: Icon(menu.icon),
      activeIcon: Icon(menu.activeIcon),
    );
  }
}
