import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:get/get.dart';

import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/shared/router.dart';
import 'package:affinity_destiny/shared/constant.dart';

class AppStartPage extends StatelessWidget {
  const AppStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: AppConstant.colorTransparent,
                elevation: 0,
              ),
              const Spacer(flex: 2),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildButton(context),
                    const SizedBox(height: 20),
                    _buildLoginWay(context),
                    const SizedBox(height: 10),
                    _buildLoginWayDetail(context),
                    const SizedBox(height: 10),
                    _buildAgreement(context),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRouter.registerStart);
          },
          style: ButtonStyle(
            side: WidgetStateProperty.all<BorderSide>(
                const BorderSide(color: AppConstant.colorWhite)),
            fixedSize: WidgetStateProperty.all<Size>(Size(Get.width * 0.3, 40)),
          ),
          child: Text(
            LangKey.startSignUp.tr,
            style: AppConstant.textThemePrimary.titleSmall!
                .copyWith(color: AppConstant.colorWhite),
          ),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRouter.loginByPhone);
          },
          style: ButtonStyle(
            side: WidgetStateProperty.all<BorderSide>(
                const BorderSide(color: AppConstant.colorWhite)),
            fixedSize: WidgetStateProperty.all<Size>(Size(Get.width * 0.3, 40)),
          ),
          child: Text(
            LangKey.startSignIn.tr,
            style: AppConstant.textThemePrimary.titleSmall!
                .copyWith(color: AppConstant.colorWhite),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginWay(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: Get.width * 0.15,
          child: const Divider(
            thickness: 1.0,
            color: AppConstant.colorWhite,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          LangKey.startSignInOtherWay.tr,
          style: AppConstant.textThemePrimary.labelMedium!
              .copyWith(color: AppConstant.colorWhite),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: Get.width * 0.15,
          child: const Divider(
            thickness: 1.0,
            color: AppConstant.colorWhite,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginWayDetail(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Ionicons.aperture_outline,
          color: AppConstant.colorWhite,
          size: 40,
        ),
      ],
    );
  }

  Widget _buildAgreement(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Ionicons.checkmark_circle_outline,
          ),
          color: AppConstant.colorWhite,
          alignment: Alignment.centerRight,
          iconSize: 12,
          padding: const EdgeInsets.fromLTRB(0, 2, 1, 0),
        ),
        Text(
          LangKey.startAgreement.tr,
          style: AppConstant.textThemePrimary.labelSmall!
              .copyWith(color: AppConstant.colorWhite),
        ),
      ],
    );
  }
}
