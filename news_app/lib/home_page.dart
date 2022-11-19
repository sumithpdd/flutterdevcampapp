import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/animations/animations.dart';
import 'package:news_app/app_constants/app_constants.dart';
import 'package:news_app/authentication/authentication.dart';
import 'package:news_app/loading/loading.dart';
import 'package:news_app/news/news.dart';
import 'package:news_app/user/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentNavBarIndex = 0;
  final guestPages = [
    const LatestHeadlinesAndArticles(),
    const CountrySpecificHeadlinesPage(),
    const LoginView(),
  ];
  final userPages = [
    const LatestHeadlinesAndArticles(),
    const CountrySpecificHeadlinesPage(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          color: Theme.of(context).iconTheme.color,
          icon: const Icon(
            Icons.menu_rounded,
          ),
        ),
        centerTitle: true,
        title: const Text(OldAppStrings.appName),
        titleTextStyle: Theme.of(context).primaryTextTheme.headline2,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
            color: Theme.of(context).iconTheme.color,
            icon: const Icon(
              Icons.search_outlined,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
          child: Consumer(
            builder: (context, ref, child) {
              ref.listen<bool>(
                isLoadingProvider,
                (_, isLoading) {
                  if (isLoading) {
                    LoadingScreen.instance().show(
                      context: context,
                    );
                  } else {
                    LoadingScreen.instance().hide();
                  }
                },
              );

              final isLoggedIn = ref.watch(isLoggedInProvider);
              if (isLoggedIn) {
                return userPages[currentNavBarIndex];
              } else {
                return guestPages[currentNavBarIndex];
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentNavBarIndex,
        onTap: (index) {
          setState(() {
            currentNavBarIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.newspaper_rounded,
            ),
            label: AppStrings.of(context).bottomNavBarLabels[0],
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.travel_explore_rounded,
            ),
            label: AppStrings.of(context).bottomNavBarLabels[1],
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.person_rounded,
            ),
            label: AppStrings.of(context).bottomNavBarLabels[2],
          ),
        ],
      ),
    );
  }
}

/// [MySearchDelegate] adds functionality to the search icon
/// on the right of the AppBar.
class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query.isEmpty ? close(context, null) : query = '';
        },
        icon: const Icon(Icons.clear_rounded),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null), // Close searchbar
      icon: const Icon(Icons.arrow_back_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO (Joshua): Cache previous search queries and show them as suggestions
    List<String> suggestions = OldAppStrings.sampleSuggestions;

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(
            suggestion,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }

  @override
  void showResults(BuildContext context) {
    close(context, null); // close search page to pop it off the stack
    Navigator.of(context).push(createFadeInTransitionForSearchResultsRoute(query),);
    super.showResults(context);
  }
}
