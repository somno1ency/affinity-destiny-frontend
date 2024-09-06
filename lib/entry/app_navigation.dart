import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';

import '../component/navigation/app_bottom_bar.dart';
import '../model/navigation/navigation_menu.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  final PageController _controller = PageController();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final List<NavigationMenu> menus = [
      NavigationMenu(
        label: AppLocalizations.of(context)!.navMenu_singleChat,
        icon: Ionicons.chatbubble_ellipses_outline,
        activeIcon: Ionicons.chatbubble_ellipses,
      ),
      NavigationMenu(
        label: AppLocalizations.of(context)!.navMenu_groupChat,
        icon: Ionicons.chatbubbles_outline,
        activeIcon: Ionicons.chatbubbles,
      ),
      NavigationMenu(
        label: AppLocalizations.of(context)!.navMenu_contact,
        icon: Ionicons.at_outline,
        activeIcon: Ionicons.at,
      ),
      NavigationMenu(
        label: AppLocalizations.of(context)!.navMenu_discovery,
        icon: Ionicons.aperture_outline,
        activeIcon: Ionicons.aperture,
      ),
      NavigationMenu(
        label: AppLocalizations.of(context)!.navMenu_account,
        icon: Ionicons.person_outline,
        activeIcon: Ionicons.person,
      ),
    ];

    return Column(
      children: [
        Expanded(child: _buildContent()),
        AppBottomBar(
          currentIndex: _index,
          callback: _onChangePage,
          menus: menus,
        ),
      ],
    );
  }

  Widget _buildContent() {
    return PageView(
      controller: _controller,
      children: const [],
    );
  }

  void _onChangePage(int index) {
    _controller.jumpToPage(index);
    setState(() {
      _index = index;
    });
  }
}
