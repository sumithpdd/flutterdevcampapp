import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/app_constants/app_constants.dart';
import 'package:news_app/news/news.dart';
import 'package:news_app/news_api/news_api.dart';

class SearchResults extends ConsumerStatefulWidget {
  final String query;

  const SearchResults({
    Key? key,
    required this.query,
  }) : super(key: key);

  @override
  ConsumerState<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends ConsumerState<SearchResults> {
  late final NewsRepository newsRepository;
  late Future<List<Article>?> futureArticles;

  @override
  void initState() {
    super.initState();

    newsRepository = ref.read(newsRepositoryProvider);
    futureArticles = newsRepository.getArticlesMatchingKeyword(widget.query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Theme.of(context).iconTheme.color,
        ),
        centerTitle: true,
        title: const Text(OldAppStrings.searchResultsTitle),
        titleTextStyle: Theme.of(context).primaryTextTheme.headline2,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            FutureBuilder(
              future: futureArticles,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                      child: SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    );
                  case ConnectionState.done:
                  default:
                    if (snapshot.hasData) {
                      return snapshot.data!.isEmpty
                          ? Center(
                              child: Text(
                                OldAppStrings.articlesListIsEmptyText,
                                style: Theme.of(context).primaryTextTheme.headline2,
                              ),
                            )
                          : ArticleListTileListView(articles: snapshot.data!);
                    } else if (snapshot.hasError) {
                      final errorMessage = snapshot.error is HttpException
                          ? snapshot.error.toString()
                          : OldAppStrings.articlesListIsEmptyText;
                      return Center(
                        child: Text(
                          '❌ $errorMessage ❌',
                          style: Theme.of(context).primaryTextTheme.headline2,
                        ),
                      );
                    } else {
                      return Center(
                        child: Text(
                          OldAppStrings.articlesListIsEmptyText,
                          style: Theme.of(context).primaryTextTheme.headline1,
                        ),
                      );
                    }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
