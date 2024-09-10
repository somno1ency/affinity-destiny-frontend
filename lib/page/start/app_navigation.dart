import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';

import '../../component/shared/app_bottom_bar.dart';
import '../../model/shared/navigation_menu.dart';
import '../../page/chat/chat_list.dart';

class AppNavigationPage extends StatefulWidget {
  final int index;

  const AppNavigationPage({super.key, this.index = 0});

  @override
  State<AppNavigationPage> createState() => _AppNavigationPageState();
}

class _AppNavigationPageState extends State<AppNavigationPage> {
  final PageController _controller = PageController();
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _index = widget.index;
  }

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
        Expanded(child: _buildContent(context)),
        AppBottomBar(
          currentIndex: _index,
          callback: _onChangePage,
          menus: menus,
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        ChatListPage(title: AppLocalizations.of(context)!.navMenu_singleChat),
        ChatListPage(title: AppLocalizations.of(context)!.navMenu_groupChat),
        ChatListPage(title: AppLocalizations.of(context)!.navMenu_contact),
        ChatListPage(title: AppLocalizations.of(context)!.navMenu_discovery),
        ChatListPage(title: AppLocalizations.of(context)!.navMenu_account),
      ],
    );
  }

  void _onChangePage(int index) {
    _controller.jumpToPage(index);
    setState(() {
      _index = index;
    });
  }
}
