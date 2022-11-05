import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/app_constants/app_constants.dart';
import 'package:news_app/authentication/authentication.dart';

class LoginView extends ConsumerWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'FirePod News App',
              style: Theme.of(context).primaryTextTheme.headline1,
              textAlign: TextAlign.center,
            ),
            const DividerWithMargins(),
            Expanded(child: loginScreenSvg),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                AppStrings.profilePageCallToAction,
                style: Theme.of(context).primaryTextTheme.headline3,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Center(
              child: ElevatedButton.icon(
                icon: const Icon(
                  FontAwesomeIcons.google,
                  color: AppColors.white,
                  size: 20,
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                ),
                onPressed: () async {
                  final result = ref.read(authStateProvider.notifier).loginWithGoogle();
                  result.log();
                },
                label: Text(
                  AppStrings.signInWithGoogleText,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
