import 'package:flutter/material.dart';
import 'package:news_app/app_constants/app_constants.dart';

class AlertsPage extends StatefulWidget {
  const AlertsPage({Key? key}) : super(key: key);

  @override
  State<AlertsPage> createState() => _AlertsPageState();
}

class _AlertsPageState extends State<AlertsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.bottomNavBarLabels[3],
        style: AppThemes.lightTheme.primaryTextTheme.headline1,
      ),
    );
  }
}
