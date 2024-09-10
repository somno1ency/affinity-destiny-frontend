import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:wrapper/wrapper.dart';

import '../../component/shared/app_chat_bar.dart';
import '../../component/shared/chat_item.dart';
import '../../model/user/user.dart';
import '../../model/chat/message_type_enum.dart';
import '../../model/chat/chat_msg.dart';
import '../../shared/constant.dart';

class ChatPage extends StatelessWidget {
  // 当前登录用户信息,以后从token中获取
  final User? currentUser;
  // 聊天目标用户信息
  final User? targetUser;

  // 不将成员变量定义为required是因为,在router中提前定义了路由,如果required,则那个时机需要进行赋值,但那个时机并不知道将来的动态参数值
  const ChatPage({
    super.key,
    this.currentUser,
    this.targetUser,
  });

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final currentUser = arguments?['currentUser'];
    final targetUser = arguments?['targetUser'];

    return Scaffold(
      appBar: AppChatBar(
        title: targetUser?.nickname,
        icon: EvaIcons.bellOffOutline,
        leading: IconButton(
          icon: const Icon(
            Ionicons.arrow_undo_outline,
            size: 24,
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              EvaIcons.moreHorizontalOutline,
              size: 24,
            ),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      children: const [
        ChatItem(
          chatMsg: ChatMsg(
            name: "Mackay",
            msg: '兄弟们，准备问老婆们要钱买布局小册吧！',
            type: MessageType.right,
            avatar: 'assets/images/avatar/avatar_001.webp',
          ),
        ),
        ChatItem(
          chatMsg: ChatMsg(
            msg: '22:03',
            type: MessageType.time,
          ),
        ),
        ChatItem(
          chatMsg: ChatMsg(
            name: '风羽',
            msg: '写好了?',
            type: MessageType.left,
            avatar: 'assets/images/avatar/avatar_002.webp',
          ),
        ),
        ChatItem(
          chatMsg: ChatMsg(
            msg: '00:03',
            type: MessageType.time,
          ),
        ),
        ChatItem(
          chatMsg: ChatMsg(
            name: 'code',
            msg: 'shut up and take my money',
            type: MessageType.left,
            avatar: 'assets/images/avatar/avatar_003.webp',
          ),
        ),
        ChatItem(
          chatMsg: ChatMsg(
            name: '帅威',
            msg: '昨天发工资，已经和媳妇儿要了小册钱',
            type: MessageType.left,
            // avatar: 'assets/images/avatar/avatar_002.webp',
          ),
        ),
      ],
    );
  }
}
