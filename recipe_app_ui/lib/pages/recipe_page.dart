import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_app_ui/constants/constants.dart';
import 'package:recipe_app_ui/custom_widgets/custom_widgets.dart';
import 'package:recipe_app_ui/models/models.dart';

class RecipePage extends StatefulWidget {
  final Recipe recipe;
  final int colorIndex;

  const RecipePage({
    Key? key,
    required this.recipe,
    required this.colorIndex,
  }) : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  int currentIndex = 0;
  late final Color currentColor;

  @override
  void initState() {
    super.initState();
    currentColor = cardColorsList[widget.colorIndex % cardColorsList.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: currentColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: currentColor,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.recipe.uuid,
              child: Container(
                padding: const EdgeInsets.only(left: 25.0, top: 20),
                constraints: const BoxConstraints(
                  maxHeight: 300,
                ),
                decoration: BoxDecoration(
                  color: currentColor,
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Text(
                      widget.recipe.name,
                      style: Theme.of(context).textTheme.headline1,
                      softWrap: true,
                    ),
                    Positioned(
                      right: -80,
                      child: Image.asset(
                        widget.recipe.imageUrl,
                        scale: 2.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 20,
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.schedule_outlined,
                                color: Theme.of(context).iconTheme.color,
                                size: 20,
                              ),
                            ),
                            const WidgetSpan(
                              child: SizedBox(
                                width: 10,
                              ),
                            ),
                            TextSpan(
                              text: '${widget.recipe.duration} min',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 100,
                      left: 20,
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.person,
                                color: Theme.of(context).iconTheme.color,
                                size: 20,
                              ),
                            ),
                            const WidgetSpan(
                              child: SizedBox(
                                width: 10,
                              ),
                            ),
                            TextSpan(
                              text: '${widget.recipe.servingsCount} servings',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 150,
                      left: 20,
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.local_fire_department,
                                color: Theme.of(context).iconTheme.color,
                                size: 20,
                              ),
                            ),
                            const WidgetSpan(
                              child: SizedBox(
                                width: 10,
                              ),
                            ),
                            TextSpan(
                              text: '${widget.recipe.calories.floor()} calories',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: 20,
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText2,
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.star_sharp,
                                color: Theme.of(context).iconTheme.color,
                                size: 20,
                              ),
                            ),
                            WidgetSpan(
                              child: Icon(
                                Icons.star_sharp,
                                color: Theme.of(context).iconTheme.color,
                                size: 20,
                              ),
                            ),
                            WidgetSpan(
                              child: Icon(
                                Icons.star_sharp,
                                color: Theme.of(context).iconTheme.color,
                                size: 20,
                              ),
                            ),
                            WidgetSpan(
                              child: Icon(
                                Icons.star_sharp,
                                color: Theme.of(context).iconTheme.color,
                                size: 20,
                              ),
                            ),
                            WidgetSpan(
                              child: Icon(
                                Icons.star_half,
                                color: Theme.of(context).iconTheme.color,
                                size: 20,
                              ),
                            ),
                            const WidgetSpan(
                              child: SizedBox(
                                width: 10,
                              ),
                            ),
                            TextSpan(
                              text: '${widget.recipe.reviewCount} reviews',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 20, right: 25),
              child: IngredientsAndDirectionsSection(
                ingredients: widget.recipe.ingredients!,
                directions: widget.recipe.directions!,
                colorIndex: widget.colorIndex,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryIconTheme.color,
        unselectedItemColor: Theme.of(context).primaryIconTheme.color,
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
