import 'package:recipe_app_ui/models/models.dart';

class RecipeList {
  final List<Recipe> recipes;

  RecipeList({
    required this.recipes,
  });

  factory RecipeList.fromJson(List<dynamic> parsedJson) {
    final jsonRecipes = parsedJson
        .map(
          (recipe) => Recipe.fromJson(recipe),
        )
        .toList();

    return RecipeList(
      recipes: jsonRecipes,
    );
  }
}