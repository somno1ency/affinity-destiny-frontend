import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import '../../model/user/user.dart';
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

    return Column(
      children: [
        Text(
            'ChatPage=> currentUser: ${currentUser?.nickname}, targetUser: ${targetUser?.nickname}'),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, routerSingleChatList);
          },
          icon: Icon(EvaIcons.arrowBack),
        ),
      ],
    );
  }
}
