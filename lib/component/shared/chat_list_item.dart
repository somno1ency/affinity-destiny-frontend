import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../model/chat/chat_list_item_info.dart';

class ChatListItem extends StatelessWidget {
  final ChatListItemInfo chatListItemInfo;
  final VoidCallback callback;

  const ChatListItem({
    super.key,
    required this.chatListItemInfo,
    required this.callback,
  });

  IconData get icon => chatListItemInfo.isDisturb
      ? EvaIcons.bellOffOutline
      : EvaIcons.bellOutline;

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
            _buildAvatar(context),
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

  Widget _buildAvatar(BuildContext context) {
    Widget avatar;
    if (chatListItemInfo.avatar != null) {
      avatar = CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(chatListItemInfo.avatar!),
      );
    } else {
      avatar = CircleAvatar(
        radius: 30,
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.5),
        child: Text(
          chatListItemInfo.name!.substring(0, 1),
          style: Theme.of(context).primaryTextTheme.bodyMedium!.copyWith(
                color: Colors.grey,
              ),
        ),
      );
    }

    return avatar;
  }

  Widget _buildName(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          chatListItemInfo.name,
          style: Theme.of(context).primaryTextTheme.titleSmall!.copyWith(
              color: Theme.of(context).primaryColor.withOpacity(0.9),
              fontWeight: FontWeight.bold),
        ),
        chatListItemInfo.lastMsgTime != null
            ? Text(
                chatListItemInfo.lastMsgTime!,
                style: Theme.of(context).primaryTextTheme.labelSmall!.copyWith(
                      color: Theme.of(context).primaryColor.withOpacity(0.7),
                    ),
              )
            : const Text('')
      ],
    );
  }

  Widget _buildMsg(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        chatListItemInfo.lastMsg != null
            ? Text(
                chatListItemInfo.unreadCount >= 10
                    ? AppLocalizations.of(context)!.chat_unreadCountTips(
                            chatListItemInfo.unreadCount) +
                        chatListItemInfo.lastMsg!
                    : chatListItemInfo.lastMsg!,
                style: Theme.of(context).primaryTextTheme.labelMedium!.copyWith(
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                    ),
              )
            : const Text(''),
        Icon(
          icon,
          size: 14,
          color: Theme.of(context).primaryColor.withOpacity(0.7),
        ),
      ],
    );
  }
}
