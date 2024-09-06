import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'shared/constant.dart';
import 'entry/app_navigation.dart';
import 'entry/app_start.dart';
import 'page/start/register.dart';
import 'page/start/register_code.dart';
import 'page/start/login_phone.dart';
import 'page/start/login_code.dart';
import 'page/start/login_password.dart';

part 'shared/router.dart';

void main() {
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
          backgroundColor: Colors.white,
          elevation: 3,
          type: BottomNavigationBarType.fixed,
        ),
        primaryColor: const Color.fromARGB(255, 164, 147, 255),
        primaryTextTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 16,
            fontFamily: 'Consolas',
          ),
          labelLarge: TextStyle(
            fontFamily: 'Consolas',
            fontSize: 28,
          ),
          labelMedium: TextStyle(
            fontFamily: 'Consolas',
            fontSize: 12,
          ),
          labelSmall: TextStyle(
            fontFamily: 'Consolas',
            fontSize: 10,
          ),
        ),
        textTheme: const TextTheme(
          labelMedium: TextStyle(
            fontFamily: 'Consolas',
            fontSize: 24,
          ),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
          ),
          backgroundColor: Colors.white,
          titleTextStyle:
              Theme.of(context).primaryTextTheme.titleLarge!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
      ),
      routes: routeMap,
      initialRoute: appLogin == true ? routerLoginByPassword : routerStart,
    );
  }
}
