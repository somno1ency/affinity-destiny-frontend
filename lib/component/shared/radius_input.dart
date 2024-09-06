import 'package:flutter/material.dart';

class RadiusInput extends StatelessWidget {
  final double sideWidth;
  final double bodyWidth;
  final double height;
  final double radius;
  final Widget leftPart;
  final Widget rightPart;
  final String hintText;

  const RadiusInput({
    super.key,
    required this.sideWidth,
    required this.bodyWidth,
    required this.height,
    required this.radius,
    required this.leftPart,
    required this.rightPart,
    required this.hintText,
  });

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
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    fontSize: 12,
                  ),
                ),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
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
