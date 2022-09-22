import 'package:flutter/material.dart';
import 'package:recipe_app_ui/constants/colors.dart';

class RecipeCard extends StatelessWidget {
  final int index;

  const RecipeCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 200,
        maxHeight: 250,
      ),
      decoration: BoxDecoration(
        color: cardColorsList[index % cardColorsList.length],
        borderRadius: const BorderRadius.all(Radius.circular(40)),
      ),
    );
  }
}
