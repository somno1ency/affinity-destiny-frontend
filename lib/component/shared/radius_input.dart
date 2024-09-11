import 'package:flutter/material.dart';

import '../../shared/constant.dart';

class RadiusInput extends StatelessWidget {
  final double sideWidth;
  final double bodyWidth;
  final double height;
  final double radius;
  final Widget leftPart;
  final Widget rightPart;
  final String hintText;
  final double fontSize;

  const RadiusInput({
    super.key,
    required this.sideWidth,
    required this.bodyWidth,
    required this.height,
    required this.radius,
    required this.leftPart,
    required this.rightPart,
    required this.hintText,
    required this.fontSize,
  });

  double get verticalPadding => (height - fontSize - 2) / 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: sideWidth,
              height: height,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(radius),
                  bottomLeft: Radius.circular(radius),
                ),
              ),
              child: leftPart,
            ),
            Container(
              width: bodyWidth,
              height: height,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Theme.of(context).primaryColor),
                  bottom: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
              child: TextField(
                cursorColor: Theme.of(context).primaryColor,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: verticalPadding,
                    horizontal: 10,
                  ),
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle:
                      Theme.of(context).primaryTextTheme.labelMedium!.copyWith(
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(opacity5),
                            height: 1,
                          ),
                ),
                style: Theme.of(context)
                    .primaryTextTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
            Container(
              width: sideWidth,
              height: height,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(radius),
                  bottomRight: Radius.circular(radius),
                ),
              ),
              child: rightPart,
            ),
          ],
        ),
      ],
    );
  }
}
