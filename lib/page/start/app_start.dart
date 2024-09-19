import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../shared/constant.dart';

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
                backgroundColor: colorTransparent,
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
            Navigator.of(context).pushNamed(routerRegisterStart);
          },
          style: ButtonStyle(
            side: WidgetStateProperty.all<BorderSide>(
                const BorderSide(color: colorWhite)),
            fixedSize: WidgetStateProperty.all<Size>(
                Size(MediaQuery.of(context).size.width * 0.3, 40)),
          ),
          child: Text(
            AppLocalizations.of(context)!.start_signUp,
            style: textThemePrimary.titleSmall!.copyWith(color: colorWhite),
          ),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(routerLoginByPhone);
          },
          style: ButtonStyle(
            side: WidgetStateProperty.all<BorderSide>(
                const BorderSide(color: colorWhite)),
            fixedSize: WidgetStateProperty.all<Size>(
                Size(MediaQuery.of(context).size.width * 0.3, 40)),
          ),
          child: Text(
            AppLocalizations.of(context)!.start_signIn,
            style: textThemePrimary.titleSmall!.copyWith(color: colorWhite),
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
          width: MediaQuery.of(context).size.width * 0.15,
          child: const Divider(
            thickness: 1.0,
            color: colorWhite,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          AppLocalizations.of(context)!.start_signInOtherWay,
          style: textThemePrimary.labelMedium!.copyWith(color: colorWhite),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.15,
          child: const Divider(
            thickness: 1.0,
            color: colorWhite,
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
          color: colorWhite,
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
          color: colorWhite,
          alignment: Alignment.centerRight,
          iconSize: 12,
          padding: const EdgeInsets.fromLTRB(0, 2, 1, 0),
        ),
        Text(
          AppLocalizations.of(context)!.start_agreement,
          style: textThemePrimary.labelSmall!.copyWith(color: colorWhite),
        ),
      ],
    );
  }
}
