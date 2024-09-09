import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChatListItem extends StatelessWidget {
  final String avatar;
  final String name;
  final String msg;
  final int unreadCount;
  final bool isDisturb;
  final String time;
  final VoidCallback callback;

  const ChatListItem({
    super.key,
    required this.avatar,
    required this.name,
    required this.msg,
    required this.time,
    required this.callback,
    this.isDisturb = false,
    this.unreadCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
            ),
          ),
        ),
        child: Row(
          children: [
            _buildAvatar(),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildName(context),
                  _buildMsg(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return CircleAvatar(
      radius: 30,
      backgroundImage: AssetImage(avatar),
    );
  }

  Widget _buildName(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: Theme.of(context).primaryTextTheme.titleLarge!.copyWith(
              color: Theme.of(context).primaryColor.withOpacity(0.9),
              fontWeight: FontWeight.bold),
        ),
        Text(
          time,
          style: Theme.of(context).primaryTextTheme.labelSmall!.copyWith(
                color: Theme.of(context).primaryColor.withOpacity(0.7),
              ),
        ),
      ],
    );
  }

  Widget _buildMsg(BuildContext context) {
    String currentMsg = unreadCount >= 10
        ? AppLocalizations.of(context)!.chat_unreadCountTips(unreadCount) + msg
        : msg;
    IconData icon = isDisturb ? EvaIcons.bellOffOutline : EvaIcons.bellOutline;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          currentMsg,
          style: Theme.of(context).primaryTextTheme.labelMedium!.copyWith(
                color: Theme.of(context).primaryColor.withOpacity(0.8),
              ),
        ),
        Icon(
          icon,
          size: 14,
          color: Theme.of(context).primaryColor.withOpacity(0.7),
        ),
      ],
    );
  }
}
