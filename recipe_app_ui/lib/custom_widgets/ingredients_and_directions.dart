import 'package:flutter/material.dart';
import 'package:recipe_app_ui/constants/constants.dart';

class IngredientsAndDirectionsSection extends StatelessWidget {
  final List<String> ingredients;
  final List<String> directions;

  const IngredientsAndDirectionsSection({
    Key? key,
    required this.ingredients,
    required this.directions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ingredientsTitle,
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(
          directionsTitle,
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    );
  }
}
