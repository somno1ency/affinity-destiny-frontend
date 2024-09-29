import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/model/component/chat_start_item.dart';
import 'package:affinity_destiny/shared/constant.dart';

class ChatStartUnit extends StatelessWidget {
  final ChatStartItem chatStartItem;
  final VoidCallback callback;

  const ChatStartUnit({
    super.key,
    required this.chatStartItem,
    required this.callback,
  });

  IconData get icon =>
      chatStartItem.isDisturb ? EvaIcons.bellOffOutline : EvaIcons.bellOutline;

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
          color: AppConstant.colorWhite,
          border: Border(
            bottom: BorderSide(
              color: AppConstant.colorGrey.withOpacity(AppConstant.opacity1),
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
    if (chatStartItem.avatar != null) {
      avatar = CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(chatStartItem.avatar!),
      );
    } else {
      avatar = CircleAvatar(
        radius: 30,
        backgroundColor:
            AppConstant.colorTheme.withOpacity(AppConstant.opacity5),
        child: Text(
          chatStartItem.name[0],
          style: AppConstant.textThemePrimary.bodyMedium!
              .copyWith(color: AppConstant.colorGrey),
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
          chatStartItem.name,
          style: AppConstant.textThemePrimary.titleSmall!.copyWith(
              color: AppConstant.colorMain, fontWeight: FontWeight.bold),
        ),
        chatStartItem.lastMsgTime != null
            ? Text(
                chatStartItem.lastMsgTime!,
                style: AppConstant.textThemePrimary.labelSmall!
                    .copyWith(color: AppConstant.colorSub2),
              )
            : const Text('')
      ],
    );
  }

  Widget _buildMsg(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        chatStartItem.lastMsg != null
            ? Text(
                chatStartItem.unreadCount >= 10
                    ? LangKey.chatUnreadCountTips.trParams(
                            {'count': chatStartItem.unreadCount.toString()}) +
                        chatStartItem.lastMsg!
                    : chatStartItem.lastMsg!,
                style: AppConstant.textThemePrimary.labelMedium!
                    .copyWith(color: AppConstant.colorSub2),
              )
            : const Text(''),
        Icon(
          icon,
          size: 14,
          color: AppConstant.colorTheme.withOpacity(AppConstant.opacity8),
        ),
      ],
    );
  }
}
