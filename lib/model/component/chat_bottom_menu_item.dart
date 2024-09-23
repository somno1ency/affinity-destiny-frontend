import 'package:flutter/material.dart';

class ChatBottomMenuItem {
  final String name;
  final IconData icon;
  final VoidCallback callback;

  const ChatBottomMenuItem({
    required this.name,
    required this.icon,
    required this.callback,
  });
}
