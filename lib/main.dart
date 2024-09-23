import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'model/router/contact_category.dart';
import 'model/router/navigation_args.dart';
import 'model/router/chat_args.dart';
import 'model/router/chat_info_args.dart';
import 'model/router/group_args.dart';
import 'model/router/group_info_args.dart';
import 'model/router/navigation_title_args.dart';
import 'model/component/enumeration/contact_type.dart';
import 'model/orm/user.dart';
import 'model/orm/group.dart';
import 'shared/constant.dart';

import 'page/start/app_navigation.dart';
import 'page/start/app_start.dart';
import 'page/start/register.dart';
import 'page/start/register_code.dart';
import 'page/start/login_phone.dart';
import 'page/start/login_code.dart';
import 'page/start/login_password.dart';
import 'page/chat/chat.dart';
import 'page/chat/chat_info.dart';
import 'page/group/group.dart';
import 'page/group/group_info.dart';
import 'page/group/curd/group_member.dart';
import 'page/group/curd/group_name.dart';
import 'page/group/curd/group_qr_code.dart';
import 'page/group/curd/group_remark.dart';
import 'page/group/curd/group_nickname.dart';
import 'page/me/setting.dart';
import 'page/shared/set_background_way.dart';
import 'page/shared/choose_background.dart';

part 'shared/router.dart';

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
    return MaterialApp(
      onGenerateTitle: (context) {
        return AppLocalizations.of(context)!.app_title;
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: colorWhite.withOpacity(opacity95),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedLabelStyle: textThemePrimary.labelSmall,
          unselectedLabelStyle: textThemePrimary.labelSmall,
          selectedItemColor: colorTheme,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          backgroundColor: colorWhite,
          elevation: 3,
          type: BottomNavigationBarType.fixed,
        ),
        // primaryColor: const Color(0xFFA493FF),
        primaryColor: colorTheme,
        primaryTextTheme: textThemePrimary,
        textTheme: textTheme,
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
