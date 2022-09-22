import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:recipe_app_ui/models/models.dart';

Future<String> _loadRecipes() async {
  return await rootBundle.loadString('assets/recipes.json');
}

Future<RecipeList> loadRecipes() async {
  String jsonRecipes = await _loadRecipes();
  final jsonResponse = jsonDecode(jsonRecipes);
  RecipeList recipeList = RecipeList.fromJson(jsonResponse);

  return recipeList;
}
