import 'package:flutter/material.dart';

import '../helpers/app_constants.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('about'),
          backgroundColor:
              AppConstants.hexToColor(AppConstants.appPrimaryColorGreen)),
      body: const Center(
        child: Text('About flutter devcamp...'),
      ),
    );
  }
}
