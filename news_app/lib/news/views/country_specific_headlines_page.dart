import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/app_constants/app_constants.dart';
import 'package:news_app/news/news.dart';
import 'package:news_app/news_api/news_api.dart';

class CountrySpecificHeadlinesPage extends ConsumerStatefulWidget {
  const CountrySpecificHeadlinesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CountrySpecificHeadlinesPage> createState() => _CountrySpecificHeadlinesPageState();
}

class _CountrySpecificHeadlinesPageState extends ConsumerState<CountrySpecificHeadlinesPage> {
  late String lastChosenCountryCode;
  late final NewsRepository newsRepository;
  late Future<List<Article>?> futureHeadlines;

  @override
  void initState() {
    super.initState();

    newsRepository = ref.read(newsRepositoryProvider);
    lastChosenCountryCode = 'us';
    futureHeadlines = newsRepository.getHeadlinesFromCountry(lastChosenCountryCode); // Default: Ukraine
  }

  @override
  Widget build(BuildContext context) {
    // TODO (Joshua): Switch to ConsumerWidget and use .when instead of FutureBuilder
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            futureHeadlines = newsRepository.getHeadlinesFromCountry(lastChosenCountryCode);
          });
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showCountryPicker(
                      context: context,
                      countryFilter: OldAppStrings.headlineSourceCountryCodes,
                      showPhoneCode: false,
                      onSelect: (Country c) {
                        setState(() {
                          lastChosenCountryCode = c.countryCode;
                          futureHeadlines = newsRepository.getHeadlinesFromCountry(c.countryCode.toLowerCase());
                        });
                      },
                    );
                  },
                  child: Text(
                    OldAppStrings.chooseASourceText,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  OldAppStrings.defaultSourcePageInfoMessage,
                  style: Theme.of(context).primaryTextTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
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
                        return snapshot.data!.isEmpty
                            ? Center(
                                child: Text(
                                  OldAppStrings.headlinesListIsEmptyText,
                                  style: Theme.of(context).primaryTextTheme.headline2,
                                ),
                              )
                            : ArticleListTileListView(articles: snapshot.data!);
                      } else if (snapshot.hasError) {
                        final errorMessage = snapshot.error is HttpException
                            ? OldAppStrings.httpExceptionTryAgainTitle
                            : OldAppStrings.headlinesListIsEmptyText;

                        return Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  errorMessage,
                                  style: Theme.of(context).primaryTextTheme.headline3,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const Center(
                                child: ErrorCard(),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Center(
                          child: Text(
                            OldAppStrings.headlinesListIsEmptyText,
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
