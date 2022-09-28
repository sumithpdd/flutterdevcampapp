import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

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
        title: const Text('News App'),
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.newspaper_rounded,
            ),
            label: 'All Articles',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.manage_search_rounded,
            ),
            label: 'Sources',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.play_circle_rounded,
            ),
            label: 'Videos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_rounded,
            ),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
