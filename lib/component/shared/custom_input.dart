import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = isCenter ? 0 : 10;
    double verticalPadding = (height - fontSize - 2) / 2;
    // TextField文字的垂直居中使用其textAlignVertical无用,这里的使用的方式是计算,这种方案比较完美,思路是:
    // 目前场景的预置数值为:
    // 1.文字大小为12,Container高度40,则设置decoration的contentPadding的vertical属性为(40 - 12 - 2) / 2 = 13即可完美垂直居中
    // 要注意的点:
    // 1.为什么要额外-2,因为上下边框各占1高度,所以实际Container的40高度,内部只有38
    // 2.TextStyle中height一定要设置为1,这里使用hintStyle实际一定会传主题中定制的TextStyle(主题中指定为了1),这里为了兼容非主题传递的情况,强制再重新设置为1
    // height=1的意义: 实际上这个值是指行高与字体大小的比例,比如1.5,则字体大小为10时,行高为15,所以计算时就不能减去10,而是应该减15,为了降低这些动态变化的影响,直接设置为1
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: color),
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
