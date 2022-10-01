import 'package:flutter/material.dart';
import 'package:news_app/app_constants/app_constants.dart';
import 'package:news_app/models/models.dart';

class CountrySpecificHeadlinesPage extends StatefulWidget {
  const CountrySpecificHeadlinesPage({Key? key}) : super(key: key);

  @override
  State<CountrySpecificHeadlinesPage> createState() => _CountrySpecificHeadlinesPageState();
}

class _CountrySpecificHeadlinesPageState extends State<CountrySpecificHeadlinesPage> {
  late Future<List<Article>?> futureHeadlines;

  @override
  void initState() {
    super.initState();

    futureHeadlines = Future.delayed(const Duration(seconds: 0), () => []);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Center(child: Text(AppStrings.chooseASourceText)),
          ],
        ),
      ),
    );
  }
}
