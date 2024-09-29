import 'package:flutter/material.dart';

import 'package:affinity_destiny/shared/constant.dart';

class ActionItem extends StatelessWidget {
  final String? text;
  final TextStyle? textStyle;
  final IconData? icon;
  final Color? iconColor;
  final double? size;
  final VoidCallback callback;
  final bool bottomBorder;

  const ActionItem({
    super.key,
    this.text,
    this.textStyle,
    this.icon,
    this.iconColor,
    this.size,
    this.bottomBorder = false,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          border: Border(
              bottom: bottomBorder
                  ? BorderSide(
                      color: AppConstant.colorGrey
                          .withOpacity(AppConstant.opacity1))
                  : BorderSide.none),
        ),
        child: Row(
          children: [
            if (icon != null)
              Icon(
                icon,
                size: size ?? 24,
                color: iconColor ?? AppConstant.colorGrey,
              ),
            const SizedBox(width: 12),
            if (text != null)
              Text(
                text!,
                style: textStyle ?? const TextStyle(),
              ),
          ],
        ),
      ),
    );
  }
}
