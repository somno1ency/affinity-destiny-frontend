import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData? icon;
  final Color? backgroundColor;
  final Widget? trailing;
  final VoidCallback callback;
  final bool showBottomBorder;
  final bool showDivider;

  const MenuItem({
    required this.title,
    required this.callback,
    this.icon,
    this.trailing,
    this.backgroundColor,
    this.showBottomBorder = false,
    this.showDivider = false,
  });
}
