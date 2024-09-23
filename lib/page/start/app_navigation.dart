import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';

import '../../component/shared/app_bottom_bar.dart';
import '../../model/component/navigation_menu.dart';
import '../../model/router/navigation_args.dart';

import '../../page/chat/chat_list.dart';
import '../../page/group/group_list.dart';
import '../../page/contact/contact_user.dart';
import '../../page/discovery/discovery.dart';
import '../../page/me/profile.dart';

class AppNavigationPage extends StatefulWidget {
  final NavigationArgs args;

  const AppNavigationPage({
    super.key,
    required this.args,
  });

  @override
  State<AppNavigationPage> createState() => _AppNavigationPageState();
}

class _AppNavigationPageState extends State<AppNavigationPage> {
  late PageController _controller;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _index = widget.args.index;
    _controller = PageController(initialPage: _index);
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
        ChatListPage(title: widget.args.args0.topTitle),
        GroupListPage(title: widget.args.args1.topTitle),
        ContactUserPage(category: widget.args.args2),
        DiscoveryPage(title: widget.args.args3.topTitle),
        ProfilePage(title: widget.args.args4.topTitle),
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
