import 'package:flutter/material.dart';
import 'package:recipe_app_ui/models/models.dart';

class RecipePage extends StatefulWidget {
  final Recipe recipe;

  const RecipePage({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
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
      body: Column(
        children: [
          Hero(
            tag: widget.recipe.uuid,
            child: Text(
              widget.recipe.name,
              style: Theme.of(context).textTheme.headline3,
            ),
          )
        ],
      ),
    );
  }
}
