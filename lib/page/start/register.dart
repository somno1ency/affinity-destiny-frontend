import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:ionicons/ionicons.dart';

import '../../component/start/start_app_bar.dart';
import '../../component/start/start_body_skeleton.dart';
import '../../component/shared/radius_input.dart';
import '../../shared/constant.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
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
        title: AppLocalizations.of(context)!.start_signUp,
        callback: () {
          Navigator.of(context).pop();
        },
      ),
      body: StartBodySkeleton(
        tips: AppLocalizations.of(context)!.register_welcome,
        body: RadiusInput(
          sideWidth: 50,
          bodyWidth: 200,
          height: 50,
          radius: 40,
          fontSize: textThemePrimary.labelMedium!.fontSize!,
          leftPart: Center(
            child: Text(
              cnPhonePrefix,
              style: textThemePrimary.labelMedium!.copyWith(color: colorTheme),
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
                  color: colorTheme,
                  size: 20,
                ),
              ),
            ],
          ),
          hintText: AppLocalizations.of(context)!.register_phoneTips,
        ),
        iconButton: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, routerRegisterCode);
          },
          icon: const Icon(
            EvaIcons.arrowCircleRight,
            color: colorTheme,
            size: 80,
          ),
        ),
        animation: _animation,
      ),
    );
  }
}
