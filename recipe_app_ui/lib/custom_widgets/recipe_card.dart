import 'package:flutter/material.dart';
import 'package:recipe_app_ui/constants/constants.dart';
import 'package:recipe_app_ui/models/models.dart';
import 'package:recipe_app_ui/pages/pages.dart';

class RecipeCard extends StatelessWidget {
  final List<Recipe> fetchedRecipes;

  const RecipeCard({
    Key? key,
    required this.fetchedRecipes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: fetchedRecipes.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => RecipePage(
                    recipe: fetchedRecipes[index],
                    colorIndex: index,
                  ),
                ),
              );
            },
            child: Hero(
              tag: fetchedRecipes[index].uuid,
              child: Card(
                color: cardColorsList[index % cardColorsList.length],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                      width: 200,
                      child: Image.asset(
                        fetchedRecipes[index].imageUrl,
                        scale: 2.8,
                      ),
                    ),
                    Center(
                      child: Text(
                        fetchedRecipes[index].name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText1,
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.schedule_outlined,
                              color: Theme.of(context).iconTheme.color,
                              size: 15,
                            ),
                          ),
                          TextSpan(
                            text: '${fetchedRecipes[index].duration} min',
                          ),
                          const WidgetSpan(
                            child: SizedBox(
                              width: 10,
                            ),
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.person,
                              color: Theme.of(context).iconTheme.color,
                              size: 15,
                            ),
                          ),
                          TextSpan(
                            text: '${fetchedRecipes[index].servingsCount} servings',
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText1,
                        children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.star_sharp,
                              color: Theme.of(context).iconTheme.color,
                              size: 15,
                            ),
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.star_sharp,
                              color: Theme.of(context).iconTheme.color,
                              size: 15,
                            ),
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.star_sharp,
                              color: Theme.of(context).iconTheme.color,
                              size: 15,
                            ),
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.star_sharp,
                              color: Theme.of(context).iconTheme.color,
                              size: 15,
                            ),
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.star_half,
                              color: Theme.of(context).iconTheme.color,
                              size: 15,
                            ),
                          ),
                          TextSpan(
                            text: '${fetchedRecipes[index].reviewCount} reviews',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
