import 'package:flutter/material.dart';
import 'package:recipe_app_ui/constants/constants.dart';

class IngredientsAndDirectionsSection extends StatelessWidget {
  final List<String> ingredients;
  final List<String> directions;
  final int colorIndex;

  const IngredientsAndDirectionsSection({
    Key? key,
    required this.ingredients,
    required this.directions,
    required this.colorIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ingredientsTitle,
          style: Theme.of(context).textTheme.headline4,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: ingredients.length,
            itemBuilder: (context, index) {
              return ListTile(
                horizontalTitleGap: -20,
                visualDensity: const VisualDensity(vertical: -4),
                leading: Text(
                  '\u2022',
                  style: TextStyle(
                    color: cardColorsList[colorIndex % cardColorsList.length],
                  ),
                ),
                title: Text(
                  ingredients[index],
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 10,
                  ),
                ),
              );
            },
          ),
        ),
        Text(
          directionsTitle,
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(
          height: 20,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: directions.length,
            itemBuilder: (context, index) {
              return ListTile(
                horizontalTitleGap: -20,
                leading: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: cardColorsList[colorIndex % cardColorsList.length],
                  ),
                ),
                title: Text(directions[index], style: const TextStyle(color: Colors.blueGrey,),),
              );
            },
          ),
        ),
      ],
    );
  }
}
