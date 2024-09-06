import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppStart extends StatelessWidget {
  const AppStart({super.key});

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
                backgroundColor: Colors.transparent,
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
          onPressed: () {},
          style: ButtonStyle(
            side: WidgetStateProperty.all<BorderSide>(
                const BorderSide(color: Colors.white)),
            fixedSize: WidgetStateProperty.all<Size>(
                Size(MediaQuery.of(context).size.width * 0.3, 40)),
          ),
          child: Text(
            AppLocalizations.of(context)!.start_signUp,
            style: Theme.of(context)
                .primaryTextTheme
                .labelMedium!
                .copyWith(color: Colors.white),
          ),
        ),
        OutlinedButton(
          onPressed: () {},
          style: ButtonStyle(
            side: WidgetStateProperty.all<BorderSide>(
                const BorderSide(color: Colors.white)),
            fixedSize: WidgetStateProperty.all<Size>(
                Size(MediaQuery.of(context).size.width * 0.3, 40)),
          ),
          child: Text(
            AppLocalizations.of(context)!.start_signIn,
            style: Theme.of(context)
                .primaryTextTheme
                .labelMedium!
                .copyWith(color: Colors.white),
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
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          AppLocalizations.of(context)!.start_signInOtherWay,
          style: Theme.of(context)
              .primaryTextTheme
              .labelMedium!
              .copyWith(color: Colors.white),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.15,
          child: const Divider(
            thickness: 1.0,
            color: Colors.white,
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
          color: Colors.white,
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
          color: Colors.white,
          alignment: Alignment.centerRight,
          iconSize: 12,
          padding: const EdgeInsets.fromLTRB(0, 2, 1, 0),
        ),
        Text(
          AppLocalizations.of(context)!.start_agreement,
          style: Theme.of(context)
              .primaryTextTheme
              .labelSmall!
              .copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
