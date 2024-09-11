import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:english_words/english_words.dart';

import 'dart:math';

import '../../component/chat/app_chat_bar.dart';
import '../../component/shared/custom_input.dart';
import '../../component/chat/chat_list_item.dart';
import '../../model/orm/user.dart';
import '../../model/orm/group.dart';
import '../../model/component/chat_list_item_info.dart';
import '../../shared/constant.dart';

class GroupListPage extends StatefulWidget {
  final String title;

  const GroupListPage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _GroupListPageState();
}

class _GroupListPageState extends State<GroupListPage> {
  final Random _random = Random();
  User get currentUser => const User(
        id: 1,
        mobile: '19918900255',
        avatar: '/assets/images/avatar/avatar_001.webp',
        sex: 1,
        nickname: '叶落无痕',
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppChatBar(
        title: widget.title,
        actions: [
          IconButton(
            icon: const Icon(EvaIcons.plusCircleOutline),
            color: colorWhite,
            iconSize: 24,
            onPressed: () {
              _showAddMenu(context);
            },
          ),
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    List<ChatListItemInfo> fakeInfoItems = [];
    for (int i = 0; i < 100; i++) {
      int identity = _random.nextInt(3) + 1;
      fakeInfoItems.add(
        ChatListItemInfo(
          // TODO: 如果为空,则取当前群的owner对应的头像+任意三个成员的头像形成一张新的图片,只第一次计算一计,以后固定到数据库的icon中,先不处理
          // avatar: identity > 0
          // ? 'assets/images/avatar/avatar_00$identity.webp'
          //     : '',
          avatar: 'assets/images/avatar/avatar_00$identity.webp',
          name: '${WordPair.random().asPascalCase}Group',
          lastMsg: 'This is group last msg $i...',
          unreadCount: _random.nextInt(10) * 10,
          lastMsgTime: 'Yesterday $i',
          isDisturb: i % 2 == 0,
        ),
      );
    }

    return Column(
      children: [
        CustomInput(
          color: Theme.of(context).primaryColor,
          hintText: AppLocalizations.of(context)!.search_placeholder,
          hintStyle: Theme.of(context).primaryTextTheme.labelMedium!.copyWith(
              color: Theme.of(context).primaryColor.withOpacity(opacity5)),
          fontSize: 12,
          isCenter: false,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: fakeInfoItems.length,
            itemBuilder: (context, index) {
              int identity = _random.nextInt(3) + 1;
              return ChatListItem(
                chatListItemInfo: fakeInfoItems[index],
                callback: () {
                  Group targetGroup = Group(
                    id: index,
                    ownerId: 1,
                    groupId: 'xxx',
                    name: WordPair.random().asPascalCase,
                    category: _random.nextInt(10),
                    // 在群聊界面详情并不需要显示群头像,所以这个字段传过去没有用处
                    icon: identity > 0
                        ? 'assets/images/avatar/avatar_00$identity.webp'
                        : '',
                    memo: WordPair.random().asSnakeCase,
                  );
                  Navigator.pushNamed(
                    context,
                    routerGroupChat,
                    arguments: {
                      'currentUser': currentUser,
                      'targetGroup': targetGroup,
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  void _showAddMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset offset = button.localToGlobal(Offset.zero);
    final double x = offset.dx + button.size.width;
    final double y = offset.dy;

    showMenu(
      context: context,
      elevation: 0,
      shadowColor: colorTransparent,
      position: RelativeRect.fromLTRB(x, y, 0, 0),
      items: [
        _buildMenuItem(
          context,
          AppLocalizations.of(context)!.chat_startGroupChat,
          Ionicons.chatbubble_ellipses_outline,
          () {},
        ),
        _buildMenuItem(
          context,
          AppLocalizations.of(context)!.chat_addFriend,
          Ionicons.person_add_outline,
          () {},
        ),
      ],
    );
  }

  PopupMenuItem _buildMenuItem(
    BuildContext context,
    String label,
    IconData icon,
    VoidCallback callback,
  ) {
    return PopupMenuItem(
      onTap: callback,
      child: Row(
        children: [
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: 16,
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: Theme.of(context)
                .primaryTextTheme
                .labelMedium!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}