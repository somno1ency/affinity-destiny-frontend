import 'package:flutter/material.dart';

import '../../../shared/constant.dart';

class GoStep extends StatelessWidget {
  final String tips;
  final double? tipsSize;
  final IconData icon;
  final double? iconSize;
  final VoidCallback callback;

  const GoStep({
    super.key,
    required this.tips,
    required this.icon,
    required this.callback,
    this.iconSize,
    this.tipsSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: callback,
          iconSize: iconSize,
          color: colorTheme,
        ),
        Text(
          tips,
          style: TextStyle(
            fontSize: tipsSize,
            color: colorTheme,
          ),
        ),
      ],
    );
  }
}
