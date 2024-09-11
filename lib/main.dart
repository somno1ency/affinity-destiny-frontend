import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'shared/constant.dart';
import 'page/start/app_navigation.dart';
import 'page/start/app_start.dart';
import 'page/start/register.dart';
import 'page/start/register_code.dart';
import 'page/start/login_phone.dart';
import 'page/start/login_code.dart';
import 'page/start/login_password.dart';
import 'page/chat/chat.dart';
import 'page/group/group.dart';

part 'shared/router.dart';

void main() {
  // 全屏模式
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) {
        return AppLocalizations.of(context)!.app_title;
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedLabelStyle: Theme.of(context).primaryTextTheme.labelSmall,
          unselectedLabelStyle: Theme.of(context).primaryTextTheme.labelSmall,
          selectedItemColor: Theme.of(context).primaryColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: colorWhite,
          elevation: 3,
          type: BottomNavigationBarType.fixed,
        ),
        // primaryColor: const Color(0xFFA493FF),
        primaryColor: colorTheme,
        primaryTextTheme: const TextTheme(
          titleSmall: TextStyle(
            fontSize: 16,
            fontFamily: 'Consolas',
            height: 1,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Consolas',
            fontSize: 25,
            height: 1,
          ),
          bodySmall: TextStyle(
            fontFamily: 'Consolas',
            fontSize: 14,
            height: 1,
          ),
          labelLarge: TextStyle(
            fontFamily: 'Consolas',
            fontSize: 28,
            height: 1,
          ),
          labelMedium: TextStyle(
            fontFamily: 'Consolas',
            fontSize: 12,
            height: 1,
          ),
          labelSmall: TextStyle(
            fontFamily: 'Consolas',
            fontSize: 10,
            height: 1,
          ),
        ),
        textTheme: const TextTheme(
          labelMedium: TextStyle(
            fontFamily: 'Consolas',
            fontSize: 24,
            height: 1,
          ),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: colorTransparent,
          ),
          backgroundColor: colorWhite,
          titleTextStyle:
              Theme.of(context).primaryTextTheme.titleLarge!.copyWith(
                    color: colorBlack,
                    fontWeight: FontWeight.bold,
                  ),
          iconTheme: const IconThemeData(color: colorBlack),
        ),
      ),
      routes: routeMap,
      initialRoute: appLogin == true ? routerMain : routerStart,
    );
  }
}
