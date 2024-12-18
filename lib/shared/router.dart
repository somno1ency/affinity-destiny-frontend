part of '../main.dart';

Map<String, WidgetBuilder> get routeMap => {
      routerMain: (context) => AppNavigationPage(
            args: ModalRoute.of(context)!.settings.arguments != null
                ? ModalRoute.of(context)!.settings.arguments as NavigationArgs
                : NavigationArgs(
                    index: 0,
                    args0: NavigationTitleArgs(
                      topTitle: AppLocalizations.of(context)!
                          .navMenu_singleChatBlanked,
                      bottomTitle:
                          AppLocalizations.of(context)!.navMenu_singleChat,
                    ),
                    args1: NavigationTitleArgs(
                      topTitle: AppLocalizations.of(context)!
                          .navMenu_groupChatBlanked,
                      bottomTitle:
                          AppLocalizations.of(context)!.navMenu_groupChat,
                    ),
                    args2: ContactCategory(
                      titleArgs: NavigationTitleArgs(
                        topTitle: AppLocalizations.of(context)!
                            .navMenu_contactBlanked,
                        bottomTitle:
                            AppLocalizations.of(context)!.navMenu_contact,
                      ),
                      type: ContactType.custom,
                    ),
                    args3: NavigationTitleArgs(
                      topTitle: AppLocalizations.of(context)!
                          .navMenu_discoveryBlanked,
                      bottomTitle:
                          AppLocalizations.of(context)!.navMenu_discovery,
                    ),
                    args4: NavigationTitleArgs(
                      topTitle:
                          AppLocalizations.of(context)!.navMenu_accountBlanked,
                      bottomTitle:
                          AppLocalizations.of(context)!.navMenu_account,
                    ),
                  ),
          ),
      routerStart: (context) => const AppStartPage(),
      routerRegisterStart: (context) => const RegisterPage(),
      routerRegisterCode: (context) => const RegisterCodePage(),
      routerLoginByPhone: (context) => const LoginByPhonePage(),
      routerLoginCode: (context) => const LoginCodePage(),
      routerLoginByPassword: (context) => const LoginByPasswordPage(),
      routerSingleChat: (context) => ChatPage(
          args: ModalRoute.of(context)!.settings.arguments as ChatArgs),
      routerSingleDetail: (context) => ChatInfoPage(
          args: ModalRoute.of(context)!.settings.arguments as ChatInfoArgs),
      routerGroupChat: (context) => GroupPage(
          args: ModalRoute.of(context)!.settings.arguments as GroupArgs),
      routerGroupDetail: (context) => GroupInfoPage(
          args: ModalRoute.of(context)!.settings.arguments as GroupInfoArgs),
      routerGroupMemberDetail: (context) => GroupMemberPage(
          users: ModalRoute.of(context)!.settings.arguments as List<User>),
      routerGroupSetName: (context) => GroupNamePage(
          group: ModalRoute.of(context)!.settings.arguments as Group),
      routerGroupQrCode: (context) => GroupQrCodePage(
          group: ModalRoute.of(context)!.settings.arguments as Group),
      routerGroupSetRemark: (context) => GroupRemarkPage(
          group: ModalRoute.of(context)!.settings.arguments as Group),
      routerGroupSetNickname: (context) => GroupNicknamePage(
          group: ModalRoute.of(context)!.settings.arguments as Group),
      routerSetBackgroundWay: (context) => const SetBackgroundWayPage(),
      routerChooseBackground: (context) => const ChooseBackgroundPage(),
      routerSetting: (context) => const SettingPage(),
    };
