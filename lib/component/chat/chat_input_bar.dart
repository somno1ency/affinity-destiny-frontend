import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class ChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback callback;

  const ChatInputBar({
    super.key,
    required this.controller,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              color: Theme.of(context).primaryColor.withOpacity(0.4)),
        ),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Ionicons.mic_circle_outline),
            onPressed: () {},
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor.withOpacity(0.4),
                ),
              ),
              child: TextField(
                cursorColor: Theme.of(context).primaryColor,
                style: Theme.of(context).primaryTextTheme.bodySmall,
                controller: controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  // TODO: 这里为何不遵循component/shared/custom_input.dart关于垂直居中的方案了,需要再考虑
                  contentPadding: EdgeInsets.only(
                    left: 12,
                    right: 12,
                    bottom: 10,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Ionicons.happy_outline, size: 20),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(EvaIcons.plusCircleOutline, size: 20),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
