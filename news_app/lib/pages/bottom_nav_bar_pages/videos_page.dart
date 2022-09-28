import 'package:flutter/material.dart';
import 'package:news_app/app_constants/app_constants.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({Key? key}) : super(key: key);

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.bottomNavBarLabels[2],
        style: AppThemes.lightTheme.primaryTextTheme.headline1,
      ),
    );
  }
}
