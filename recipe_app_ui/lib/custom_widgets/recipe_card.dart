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
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 200,
                  maxHeight: 240,
                ),
                decoration: BoxDecoration(
                  color: cardColorsList[index % cardColorsList.length],
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(fetchedRecipes[index].imageUrl),
                    Text(
                      fetchedRecipes[index].name,
                      style: Theme.of(context).textTheme.headline3,
                    ),
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
