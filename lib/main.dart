import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:affinity_destiny/lang/translation_service.dart';
import 'package:affinity_destiny/lang/lang_key.dart';
import 'package:affinity_destiny/app/shared/controller/shared.dart';
import 'package:affinity_destiny/shared/router.dart';
import 'package:affinity_destiny/shared/constant.dart';

void main() {
  // full screen mode
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: TranslationService(),
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      title: LangKey.appTitle.tr,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor:
            AppConstant.colorWhite.withOpacity(AppConstant.opacity95),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedLabelStyle: AppConstant.textThemePrimary.labelSmall,
          unselectedLabelStyle: AppConstant.textThemePrimary.labelSmall,
          selectedItemColor: AppConstant.colorTheme,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: AppConstant.colorWhite,
          elevation: 3,
          type: BottomNavigationBarType.fixed,
        ),
        // primaryColor: const Color(0xFFA493FF),
        primaryColor: AppConstant.colorTheme,
        primaryTextTheme: AppConstant.textThemePrimary,
        textTheme: AppConstant.textTheme,
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: AppConstant.colorTransparent,
          ),
          backgroundColor: AppConstant.colorWhite,
          titleTextStyle:
              Theme.of(context).primaryTextTheme.titleLarge!.copyWith(
                    color: AppConstant.colorBlack,
                    fontWeight: FontWeight.bold,
                  ),
          iconTheme: const IconThemeData(color: AppConstant.colorBlack),
        ),
      ),
      initialRoute: AppConstant.appLogin == true
          ? AppRouter.chatStart
          : AppRouter.appStart,
      getPages: AppRouter.routers,
      onInit: () {
        Get.put(SharedController());
      },
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 100),
    );
  }
}
