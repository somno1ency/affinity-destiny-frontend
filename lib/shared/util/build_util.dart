import 'package:flutter/material.dart';

class BuildUtil {
  const BuildUtil._();

  static PopupMenuItem<String> buildPopupMenuItem(
    IconData icon,
    Color color,
    String text,
    TextStyle textStyle,
    VoidCallback callback,
  ) {
    return PopupMenuItem<String>(
      onTap: callback,
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 16,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
