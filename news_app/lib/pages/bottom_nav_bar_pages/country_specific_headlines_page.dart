import 'package:flutter/material.dart';
import 'package:news_app/app_constants/app_constants.dart';

class CountrySpecificHeadlinesPage extends StatefulWidget {
  const CountrySpecificHeadlinesPage({Key? key}) : super(key: key);

  @override
  State<CountrySpecificHeadlinesPage> createState() => _CountrySpecificHeadlinesPageState();
}

class _CountrySpecificHeadlinesPageState extends State<CountrySpecificHeadlinesPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Country Search',
        style: AppThemes.lightTheme.primaryTextTheme.headline1,
      ),
    );
  }
}
