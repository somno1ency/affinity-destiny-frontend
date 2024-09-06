import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'shared/constant.dart';
import 'entry/app_navigation.dart';
import 'entry/app_start.dart';
import 'page/start/register.dart';
import 'page/start/register_code.dart';

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
        // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        //   selectedLabelStyle: TextStyle(fontSize: 10),
        //   unselectedLabelStyle: TextStyle(fontSize: 10),
        // ),
        // primarySwatch: Colors.purple,
        primaryColor: Color.fromARGB(255, 164, 147, 255),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
          ),
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      routes: routeMap,
      initialRoute: appLogin == true ? routerRegisterCode : routerStart,
    );
  }
}
