import 'package:flutter/material.dart';
import 'package:news_app/app_constants/app_constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.bottomNavBarLabels[4],
        style: AppThemes.lightTheme.primaryTextTheme.headline1,
      ),
    );
  }
}
