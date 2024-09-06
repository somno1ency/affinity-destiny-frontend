import 'package:flutter/material.dart';

class NavigationMenu {
  final String label;
  final IconData icon;
  final IconData activeIcon;

  const NavigationMenu({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });
}
