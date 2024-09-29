import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/component/start/start_app_bar.dart';
import 'package:affinity_destiny/component/start/start_body_skeleton.dart';
import 'package:affinity_destiny/component/shared/go_step.dart';
import 'package:affinity_destiny/shared/router.dart';
import 'package:affinity_destiny/shared/constant.dart';

class RegisterCodePage extends StatefulWidget {
  const RegisterCodePage({super.key});

  @override
  State<RegisterCodePage> createState() => _RegisterCodePageState();
}

class _RegisterCodePageState extends State<RegisterCodePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double stepPadding = (Get.width - (48 * 6 + 10 * 5)) * 0.5 - 12;
    stepPadding = stepPadding > 0 ? stepPadding : 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: StartAppBar(
        title: LangKey.startSignUp.tr,
        callback: () {
          Get.back();
        },
      ),
      body: StartBodySkeleton(
        tips: LangKey.registerPhoneCodeTips.tr,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: stepPadding,
                bottom: 25,
              ),
              child: GoStep(
                tips: LangKey.registerPrevStep.tr,
                tipsSize: AppConstant.textThemePrimary.titleSmall!.fontSize,
                icon: EvaIcons.arrowCircleLeft,
                iconSize: 24,
                callback: () {
                  Get.back();
                },
              ),
            ),
            _buildRegisterCode(6),
          ],
        ),
        iconButton: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRouter.chatStart);
          },
          icon: const Icon(
            EvaIcons.arrowCircleRight,
            color: AppConstant.colorTheme,
            size: 80,
          ),
        ),
        animation: _animation,
      ),
    );
  }

  Widget _buildRegisterCode(int quantity) {
    List<Widget> widgets = [];
    for (int i = 0; i < quantity; i++) {
      widgets.add(
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(color: AppConstant.colorTheme),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            cursorColor: AppConstant.colorTheme,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 11),
              border: InputBorder.none,
            ),
            style: AppConstant.textTheme.labelMedium!
                .copyWith(color: AppConstant.colorTheme),
          ),
        ),
      );
      if (i < quantity - 1) {
        widgets.add(const SizedBox(width: 10));
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...widgets,
      ],
    );
  }
}
