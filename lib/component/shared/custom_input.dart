import 'package:flutter/material.dart';

import '../../shared/constant.dart';

class CustomInput extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final String hintText;
  final TextStyle? hintStyle;
  final double fontSize;
  final bool isCenter;

  const CustomInput({
    super.key,
    required this.color,
    this.width = double.infinity,
    this.height = 40,
    this.hintText = '',
    this.hintStyle = const TextStyle(),
    this.fontSize = 12,
    this.isCenter = false,
  });

  double get horizontalPadding => isCenter ? 0 : 10;

  double get verticalPadding => (height - fontSize - 2) / 2;

  @override
  Widget build(BuildContext context) {
    // text vertical center on TextField by using the attr:textAlignVertical is not affect, so we need to calculate the
    // vertical padding, the definition is:
    // 1.fontSize:12, Container height:40, so set the contentPadding's vertical of decoration to:(40 - 12 - 2) / 2 = 13,
    // so can make the text vertical center
    // attention:
    // 1.why need extra reduce 2, as the border of top and bottom need 1, so the inner container only have 38 height to
    // display
    // 2.the height of TextStyle must be 1, the meaning of height=1: actually the value is the rate of line height and
    // font size, if the value is 1.5 that indicate when font size is 10, then line height will be 15
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: colorWhite,
        border: Border(
          bottom: BorderSide(
            color: colorTheme.withOpacity(opacity3),
          ),
        ),
      ),
      child: TextField(
        textAlign: isCenter ? TextAlign.center : TextAlign.start,
        cursorColor: color,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: hintStyle!.copyWith(height: 1),
        ),
      ),
    );
  }
}
