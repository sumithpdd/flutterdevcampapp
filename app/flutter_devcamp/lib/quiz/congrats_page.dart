import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../helpers/app_constants.dart';
import '../models/models.dart';
import '../services/firestore.dart';

class CongratsPage extends StatelessWidget {
  final Quiz quiz;
  const CongratsPage({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(children: [
            Image.asset(
              "assets/images/flutterdevcamp2022_banner.png",
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '#flutterdevcamp \nLondon \nCongrats! on completing \n${quiz.title} quiz ',
                style: TextStyle(
                  color: AppConstants.hexToColor(
                      AppConstants.appPrimaryColorGreen),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ]),
          const Divider(),
          Image.asset('assets/congrats.gif'),
          const Divider(),
          ElevatedButton.icon(
            style: TextButton.styleFrom(
              backgroundColor:
                  AppConstants.hexToColor(AppConstants.appPrimaryColorAction),
            ),
            icon: const Icon(FontAwesomeIcons.check),
            label: const Text(' Mark Complete!'),
            onPressed: () {
              FirestoreService().updateUserReport(quiz);
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/topics',
                (route) => false,
              );
            },
          )
        ],
      ),
    );
  }
}
