import 'package:flutter/material.dart';
import 'package:news_app/app_constants/app_constants.dart';
import 'package:news_app/pages/pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentNavBarIndex = 0;
  final pages = [
    const AllArticlesPage(),
    const CountrySpecificHeadlinesPage(),
    const VideosPage(),
    const AlertsPage(),
    const ProfilePage(),
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
        title: const Text(AppStrings.appName),
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
      body: pages[currentNavBarIndex],
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
            label: AppStrings.bottomNavBarLabels[0],
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.travel_explore_rounded,
            ),
            label: AppStrings.bottomNavBarLabels[1],
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.play_circle_rounded,
            ),
            label: AppStrings.bottomNavBarLabels[2],
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.notifications_rounded,
            ),
            label: AppStrings.bottomNavBarLabels[3],
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.person_rounded,
            ),
            label: AppStrings.bottomNavBarLabels[4],
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
    // TODO (Joshua): Think of a way to cache previous search queries while still using SearchDelegate
    List<String> suggestions = [
      AppStrings.errorStringsForSuggestions[0],
      AppStrings.errorStringsForSuggestions[1],
      AppStrings.errorStringsForSuggestions[2],
    ];

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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SearchResults(query: query),
      ),
    );
    super.showResults(context);
  }
}
