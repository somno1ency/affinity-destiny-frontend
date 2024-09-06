import 'package:flutter/material.dart';

import '../../model/navigation/navigation_menu.dart';

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
      backgroundColor: Colors.white,
      onTap: callback,
      currentIndex: currentIndex,
      elevation: 3,
      type: BottomNavigationBarType.fixed,
      iconSize: 22,
      selectedItemColor: Theme.of(context).primaryColor,
      selectedLabelStyle: const TextStyle(fontSize: 10),
      unselectedLabelStyle: const TextStyle(fontSize: 10),
      showUnselectedLabels: true,
      showSelectedLabels: true,
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
