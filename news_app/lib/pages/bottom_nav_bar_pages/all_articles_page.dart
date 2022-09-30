import 'package:flutter/material.dart';
import 'package:news_app/app_constants/app_constants.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/repositories/repositories.dart';
import 'package:news_app/services/exceptions/exceptions.dart';
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
  late Future<List<Article>?> futureArticles;
  late Future<List<Article>?> futureHeadlines;

  @override
  void initState() {
    super.initState();

    futureArticles = widget.newsRepository.getAllArticles();
    futureHeadlines = Future.delayed(const Duration(seconds: 2), () => []);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                          color: Theme.of(context).colorScheme.onTertiaryContainer,
                        ),
                      ),
                    );
                  case ConnectionState.done:
                  default:
                    if (snapshot.hasData) {
                      return HeadlineSection(fetchedHeadlines: snapshot.data!);
                    } else if (snapshot.hasError) {
                      final errorMessage = snapshot.error is HttpException
                          ? AppStrings.httpExceptionTitle
                          : AppStrings.headlinesListIsEmptyText;
                      return Center(
                        child: Text(
                          '❌ $errorMessage ❌',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      );
                    } else {
                      return Center(
                        child: Text(
                          '❌ No headlines found ❌',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      );
                    }
                }
              },
            ),
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
                          color: Theme.of(context).colorScheme.onTertiaryContainer,
                        ),
                      ),
                    );
                  case ConnectionState.done:
                  default:
                    if (snapshot.hasData) {
                      return ArticleListTileListView(articles: snapshot.data!);
                    } else if (snapshot.hasError) {
                      final errorMessage = snapshot.error is HttpException
                          ? AppStrings.httpExceptionTitle
                          : AppStrings.articlesListIsEmptyText;
                      return Center(
                        child: Text(
                          '❌ $errorMessage ❌',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      );
                    } else {
                      return Center(
                        child: Text(
                          '❌ No articles found ❌',
                          style: Theme.of(context).textTheme.headline1,
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
