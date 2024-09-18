import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../component/chat/app_chat_bar.dart';
import '../../model/router/chat_info_args.dart';
import '../../shared/constant.dart';

class ChatInfoPage extends StatefulWidget {
  final ChatInfoArgs args;

  const ChatInfoPage({
    super.key,
    required this.args,
  });

  @override
  State<ChatInfoPage> createState() => _ChatInfoPageState();
}

class _ChatInfoPageState extends State<ChatInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppChatBar(
        title: widget.args.user.nickname,
        leading: IconButton(
          icon: const Icon(
            Ionicons.arrow_undo_outline,
            size: 24,
          ),
          color: colorWhite,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
