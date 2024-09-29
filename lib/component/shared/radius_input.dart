import 'package:flutter/material.dart';

import 'package:affinity_destiny/shared/constant.dart';

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
                border: Border.all(color: AppConstant.colorTheme),
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
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppConstant.colorTheme),
                  bottom: BorderSide(color: AppConstant.colorTheme),
                ),
              ),
              child: TextField(
                cursorColor: AppConstant.colorTheme,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: verticalPadding,
                    horizontal: 10,
                  ),
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: AppConstant.textThemePrimary.labelMedium!.copyWith(
                    color: Theme.of(context)
                        .primaryColor
                        .withOpacity(AppConstant.opacity5),
                    height: 1,
                  ),
                ),
                style: AppConstant.textThemePrimary.labelMedium!
                    .copyWith(color: AppConstant.colorTheme),
              ),
            ),
            Container(
              width: sideWidth,
              height: height,
              decoration: BoxDecoration(
                border: Border.all(color: AppConstant.colorTheme),
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
