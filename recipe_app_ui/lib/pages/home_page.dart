import 'package:flutter/material.dart';
import 'package:recipe_app_ui/constants/constants.dart';
import 'package:recipe_app_ui/custom_widgets/custom_widgets.dart';

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
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
          onPressed: () {},
          color: Theme.of(context).iconTheme.color,
          icon: const Icon(
            Icons.sort_rounded,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            color: Theme.of(context).iconTheme.color,
            icon: const Icon(
              Icons.notifications_active_rounded,
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              homePageGreeting,
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              homePageQuestion,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 20,
            ),
            const SearchBox(),
            const SizedBox(
              height: 20,
            ),
            Text(
              mostPopularRecipesTitle,
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 250,
              child: RecipeCard(),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 60,
              child: FilterListView(),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.house_outlined,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_outlined,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline_outlined,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
