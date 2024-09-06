import 'package:flutter/material.dart';

class StartBodySkeleton extends StatelessWidget {
  final String tips;
  final Widget body;
  final IconButton iconButton;
  final Animation<double> animation;

  const StartBodySkeleton({
    super.key,
    required this.tips,
    required this.body,
    required this.iconButton,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(
                0, MediaQuery.of(context).size.height * (1 - animation.value)),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                color: Colors.white,
              ),
              // color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          tips,
                          style: const TextStyle(fontSize: 28),
                        ),
                        const SizedBox(height: 100),
                        body,
                        const SizedBox(height: 20),
                        iconButton
                      ],
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
