import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../component/shared/app_chat_bar.dart';

class ChatListPage extends StatefulWidget {
  // for test
  final String title;

  const ChatListPage({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppChatBar(
        title: widget.title,
        // title: AppLocalizations.of(context)!.app_title,
        actions: _buildActions(),
      ),
      body: const Row(),
    );
  }

  List<Widget> _buildActions() {
    return [];
  }
}
