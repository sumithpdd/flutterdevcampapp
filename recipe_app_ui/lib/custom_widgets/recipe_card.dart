import 'package:flutter/material.dart';
import 'package:recipe_app_ui/constants/colors.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: cardColorsList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 200,
              maxHeight: 240,
            ),
            decoration: BoxDecoration(
              color: cardColorsList[index % cardColorsList.length],
              borderRadius: const BorderRadius.all(Radius.circular(40)),
            ),
          ),
        );
      }
    );
  }
}
