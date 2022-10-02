// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../helpers/app_constants.dart';
import '../services/auth.dart';
import 'login_button.dart';
import 'login_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> loginUser(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      context.read<AuthService>().loginUser(userNameController.text);
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/topics', (route) => false);
      print('Login Successful');
    } else {
      print('Login Not Successful');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(children: [
              Image.asset(
                "assets/images/flutterdevcamp2022_banner.png",
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '#flutterdevcamp \nLondon \n${DateFormat.MMMMd().format(DateTime.now())} ',
                  style: TextStyle(
                    color: AppConstants.hexToColor(
                        AppConstants.appPrimaryColorGreen),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ]),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  LoginTextField(
                    hintText: "Enter your UserName",
                    validator: ((value) {
                      if (value != null &&
                          value.isNotEmpty &&
                          value.length < 5) {
                        return "Your username should be more than 5 characters";
                      } else if (value != null && value.isEmpty) {
                        return "Please type your username";
                      }
                      return null;
                    }),
                    textEditingController: userNameController,
                  ),
                  SizedBox(height: 24),
                  LoginTextField(
                    textEditingController: passwordController,
                    obscureText: true,
                    hintText: 'Enter your password',
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            LoginButton(
              icon: FontAwesomeIcons.envelope,
              loginMethod: () async {
                await loginUser(context);
              },
              text: "Login",
              color: AppConstants.hexToColor(AppConstants.appPrimaryColorGreen),
            ),
            Flexible(
              child: LoginButton(
                icon: FontAwesomeIcons.userNinja,
                text: 'Continue as Guest',
                loginMethod: AuthService().anonymousLogin,
                color:
                    AppConstants.hexToColor(AppConstants.appPrimaryColorGreen),
              ),
            ),
            LoginButton(
              text: 'Sign in with Google',
              icon: FontAwesomeIcons.google,
              color:
                  AppConstants.hexToColor(AppConstants.appPrimaryColorAction),
              loginMethod: AuthService().googleLogin,
              // AuthService().googleLogin,
            ),
          ],
        ),
      ),
    );
  }
}
