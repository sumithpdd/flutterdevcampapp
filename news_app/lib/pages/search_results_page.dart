import 'package:flutter/material.dart';
import 'package:news_app/app_constants/app_constants.dart';

class SearchResults extends StatefulWidget {
  final String query;

  const SearchResults({
    Key? key,
    required this.query,
  }) : super(key: key);

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Theme.of(context).iconTheme.color,
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
        centerTitle: true,
        title: const Text(AppStrings.searchResultsTitle),
        titleTextStyle: Theme.of(context).primaryTextTheme.headline2,
      ),
      body: Center(
        child: Text(widget.query),
      ),
    );
  }
}
