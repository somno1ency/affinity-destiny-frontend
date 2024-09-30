import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/component/start/start_app_bar.dart';
import 'package:affinity_destiny/component/start/start_body_skeleton.dart';
import 'package:affinity_destiny/component/shared/radius_input.dart';
import 'package:affinity_destiny/component/shared/go_step.dart';
import 'package:affinity_destiny/shared/router.dart';
import 'package:affinity_destiny/shared/constant.dart';

class LoginByPhonePage extends StatefulWidget {
  const LoginByPhonePage({super.key});

  @override
  State<LoginByPhonePage> createState() => _LoginByPhonePageState();
}

class _LoginByPhonePageState extends State<LoginByPhonePage>
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
    double stepPadding = (Get.width - 300) * 0.5 - 12;
    stepPadding = stepPadding > 0 ? stepPadding : 0;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: StartAppBar(
        title: LangKey.startSignIn.tr,
        callback: () {
          Get.back();
        },
      ),
      body: StartBodySkeleton(
        tips: LangKey.startSignIn.tr,
        body: Column(
          children: [
            RadiusInput(
              sideWidth: 50,
              bodyWidth: 200,
              height: 50,
              radius: 40,
              fontSize: AppConstant.textThemePrimary.labelMedium!.fontSize!,
              leftPart: Center(
                child: Text(
                  AppConstant.cnPhonePrefix,
                  style: AppConstant.textThemePrimary.labelMedium!
                      .copyWith(color: AppConstant.colorTheme),
                  textAlign: TextAlign.center,
                ),
              ),
              rightPart: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Ionicons.help_circle_outline,
                      color: AppConstant.colorTheme,
                      size: 20,
                    ),
                  ),
                ],
              ),
              hintText: LangKey.registerPhoneTips.tr,
            ),
            Container(
              padding: EdgeInsets.only(
                left: stepPadding,
                top: 10,
              ),
              child: GoStep(
                tips: LangKey.loginPasswordTips.tr,
                tipsSize: AppConstant.textThemePrimary.titleSmall!.fontSize,
                icon: EvaIcons.arrowCircleRight,
                iconSize: 24,
                callback: () {
                  Get.toNamed(AppRouter.loginByPassword);
                },
              ),
            ),
          ],
        ),
        iconButton: IconButton(
          onPressed: () {
            Get.toNamed(AppRouter.loginCode);
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
}
