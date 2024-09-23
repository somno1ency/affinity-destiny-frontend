import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';

import '../../component/chat/app_chat_bar.dart';
import '../../model/component/menu_item.dart';
import '../../shared/constant.dart';

class DiscoveryPage extends StatelessWidget {
  final String title;

  const DiscoveryPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    double trailingWidth = MediaQuery.of(context).size.width * 0.4;
    List<MenuItem> menuItems = [
      MenuItem(
        title: AppLocalizations.of(context)!.discover_friendMoment,
        callback: () {},
        icon: Ionicons.aperture_outline,
        trailing: SizedBox(
          width: trailingWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                EvaIcons.chevronRightOutline,
                size: 30,
                color: colorGrey.withOpacity(opacity7),
              ),
            ],
          ),
        ),
        backgroundColor: colorWhite,
        showDivider: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.discover_customMoment,
        callback: () {},
        icon: Ionicons.fitness_outline,
        trailing: SizedBox(
          width: trailingWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                EvaIcons.chevronRightOutline,
                size: 30,
                color: colorGrey.withOpacity(opacity7),
              ),
            ],
          ),
        ),
        backgroundColor: colorWhite,
        showDivider: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.discover_relationship,
        callback: () {},
        icon: Ionicons.people_outline,
        trailing: SizedBox(
          width: trailingWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                EvaIcons.chevronRightOutline,
                size: 30,
                color: colorGrey.withOpacity(opacity7),
              ),
            ],
          ),
        ),
        backgroundColor: colorWhite,
        showDivider: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.discover_share,
        callback: () {},
        icon: Ionicons.share_social_outline,
        trailing: SizedBox(
          width: trailingWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                EvaIcons.chevronRightOutline,
                size: 30,
                color: colorGrey.withOpacity(opacity7),
              ),
            ],
          ),
        ),
        backgroundColor: colorWhite,
        showBottomBorder: true,
      ),
      MenuItem(
        title: AppLocalizations.of(context)!.discover_keyFeature,
        callback: () {},
        icon: Ionicons.star_outline,
        trailing: SizedBox(
          width: trailingWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                EvaIcons.chevronRightOutline,
                size: 30,
                color: colorGrey.withOpacity(opacity7),
              ),
            ],
          ),
        ),
        backgroundColor: colorWhite,
      ),
    ];
    List<Widget> actionItems = [];
    for (var menu in menuItems) {
      actionItems.add(
        Column(
          children: [
            ListTile(
              leading: menu.icon != null ? Icon(menu.icon) : null,
              title: Text(
                menu.title,
                style: textThemePrimary.labelMedium!.copyWith(color: colorMain),
              ),
              tileColor: menu.backgroundColor,
              trailing: menu.trailing,
              onTap: menu.callback,
            ),
            if (menu.showBottomBorder)
              Divider(
                height: 1,
                color: colorGrey.withOpacity(opacity1),
              ),
            if (menu.showDivider) const SizedBox(height: 7),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppChatBar(
        title: title,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [...actionItems],
        ),
      ),
    );
  }
}
