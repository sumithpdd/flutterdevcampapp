import 'package:flutter/material.dart';
import 'package:news_app/app_constants/app_constants.dart';

class AllArticlesPage extends StatefulWidget {
  const AllArticlesPage({Key? key}) : super(key: key);

  @override
  State<AllArticlesPage> createState() => _AllArticlesPageState();
}

class _AllArticlesPageState extends State<AllArticlesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.bottomNavBarLabels[0],
        style: AppThemes.lightTheme.primaryTextTheme.headline1,
      ),
    );
  }
}
