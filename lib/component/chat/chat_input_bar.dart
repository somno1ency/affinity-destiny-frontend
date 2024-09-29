import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:affinity_destiny/shared/constant.dart';

class ChatInputBar extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback callback;

  const ChatInputBar({
    super.key,
    required this.controller,
    required this.callback,
  });

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              color: AppConstant.colorTheme.withOpacity(AppConstant.opacity3)),
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
                  color:
                      AppConstant.colorTheme.withOpacity(AppConstant.opacity3),
                ),
              ),
              child: TextField(
                cursorColor: AppConstant.colorTheme,
                style: AppConstant.textThemePrimary.bodySmall,
                controller: widget.controller,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  // TODO: why not conform component/shared/custom_input.dart on vertical center mechanism?
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
            onPressed: widget.callback,
          ),
          IconButton(
            icon: const Icon(EvaIcons.plusCircleOutline, size: 20),
            onPressed: widget.callback,
          ),
        ],
      ),
    );
  }
}
