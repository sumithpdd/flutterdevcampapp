import 'package:uuid/uuid.dart';

class Recipe {
  final String uuid; // To help with having a unique identifier to use with the Hero tag field
  final String name;
  final String imageUrl;
  final int duration;
  final int servingsCount;
  final int reviewCount;
  final double calories;
  final List<String>? ingredients;
  final List<String>? directions;

  Recipe({
    required this.name,
    required this.imageUrl,
    required this.duration,
    required this.servingsCount,
    required this.reviewCount,
    required this.calories,
    this.ingredients,
    this.directions,
  }) : uuid = const Uuid().v4();

  factory Recipe.fromJson(Map<String, dynamic> parsedJson) {
    return Recipe(
      name: parsedJson['name'],
      imageUrl: parsedJson['imageUrl'],
      duration: parsedJson['duration'],
      servingsCount: parsedJson['servingsCount'],
      reviewCount: parsedJson['reviewCount'],
      calories: parsedJson['calories'],
      ingredients: (parsedJson['ingredients'] as List).map((e) => e as String).toList(),
      directions: (parsedJson['directions'] as List).map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'duration': duration,
      'servingsCount': servingsCount,
      'reviewCount': reviewCount,
      'calories': calories,
      'ingredients': ingredients,
      'directions': directions,
    };
  }

  @override
  String toString() => toMap().toString();
}
