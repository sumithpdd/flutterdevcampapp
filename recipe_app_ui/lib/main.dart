import 'package:flutter/material.dart';
import 'package:recipe_app_ui/pages/pages.dart';
import 'package:recipe_app_ui/constants/constants.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = RecipeAppTheme.light();

    return MaterialApp(
      title: 'Recipe App',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const HomePage(),
    );
  }
}

