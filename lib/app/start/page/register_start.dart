import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/component/start/start_app_bar.dart';
import 'package:affinity_destiny/component/start/start_body_skeleton.dart';
import 'package:affinity_destiny/component/shared/radius_input.dart';
import 'package:affinity_destiny/shared/router.dart';
import 'package:affinity_destiny/shared/constant.dart';

class RegisterStartPage extends StatefulWidget {
  const RegisterStartPage({super.key});

  @override
  State<RegisterStartPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterStartPage>
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: StartAppBar(
        title: LangKey.startSignUp.tr,
        callback: () {
          Get.back();
        },
      ),
      body: StartBodySkeleton(
        tips: LangKey.registerWelcome.tr,
        body: RadiusInput(
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
        iconButton: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRouter.registerCode);
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
