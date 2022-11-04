import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/app_constants/app_constants.dart';
import 'package:news_app/authentication/service/service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: (media.height - 200) / 5,
              child: Text(
                'FirePod News App',
                style: Theme.of(context).primaryTextTheme.headline1,
              ),
            ),
            Expanded(child: loginScreenSvg),
            const SizedBox(
              height: 50.0,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                AppStrings.profilePageCallToAction,
                style: Theme.of(context).primaryTextTheme.headline2,
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
                  padding: const EdgeInsets.all(24),
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                ),
                onPressed: () async {
                  final result = await const AuthService().loginWithGoogle();
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
