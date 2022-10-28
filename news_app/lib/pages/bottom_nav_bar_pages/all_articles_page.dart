import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_app/app_constants/app_constants.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/news/news.dart';
import 'package:news_app/repositories/repositories.dart';
import 'package:news_app/news_api/news_api.dart';
import 'package:news_app/widgets/widgets.dart';

class AllArticlesPage extends StatefulWidget {
  final NewsRepository newsRepository;

  AllArticlesPage({Key? key, NewsRepository? newsRepositoryOverride})
      : newsRepository = newsRepositoryOverride ?? NewsRepository(),
        super(key: key);

  @override
  State<AllArticlesPage> createState() => _AllArticlesPageState();
}

class _AllArticlesPageState extends State<AllArticlesPage> {
  int randomInt = Random().nextInt(ArticleCategory.values.length);
  late Future<List<Article>?> futureArticles;
  late Future<List<Article>?> futureHeadlines;

  @override
  void initState() {
    super.initState();

    futureArticles = widget.newsRepository.getAllArticles(category: ArticleCategory.values[randomInt].name);
    futureHeadlines = widget.newsRepository.getHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            randomInt = Random().nextInt(ArticleCategory.values.length);
            futureArticles = widget.newsRepository.getAllArticles(category: ArticleCategory.values[randomInt].name);
            futureHeadlines = widget.newsRepository.getHeadlines();
          });
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.headlinesTitle, style: Theme.of(context).primaryTextTheme.headline3,),
              const SizedBox(height: 10,),
              FutureBuilder<List<Article>?>(
                future: futureHeadlines,
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
                        return HeadlineSection(fetchedHeadlines: snapshot.data!);
                      } else if (snapshot.hasError) {
                        final errorMessage = snapshot.error is HttpException
                            ? AppStrings.httpExceptionTryAgainTitle
                            : AppStrings.headlinesListIsEmptyText;
                        return Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Center(
                            child: Text(
                              errorMessage,
                              style: Theme.of(context).primaryTextTheme.headline3,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: Text(
                            '❌ No headlines found ❌',
                            style: Theme.of(context).primaryTextTheme.headline1,
                          ),
                        );
                      }
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(AppStrings.articlesTitle, style: Theme.of(context).primaryTextTheme.headline3,),
              const SizedBox(height: 10,),
              FutureBuilder<List<Article>?>(
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
                        return ArticleListTileListView(articles: snapshot.data!);
                      } else if (snapshot.hasError) {
                        return Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Center(
                                child: ErrorCard(),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Center(
                          child: Text(
                            '❌ No articles found ❌',
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
      ),
    );
  }
}
