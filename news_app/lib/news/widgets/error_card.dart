import 'package:flutter/material.dart';
import 'package:news_app/app_constants/app_constants.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              OldAppStrings.articlesNotFoundImagePng,
              scale: 0.8,
              fit: BoxFit.contain,
              semanticLabel: 'Feels Bad Man',
            ),
          ],
        ),
      ),
    );
  }
}
