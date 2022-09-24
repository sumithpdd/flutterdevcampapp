import 'package:uuid/uuid.dart';

class Recipe {
  final String uuid; // To help with having a unique identifier to use with the Hero tag field
  final String name;
  final String imageUrl;
  final int duration;
  final int servingsCount;
  final int reviewCount;

  Recipe({
    required this.name,
    required this.imageUrl,
    required this.duration,
    required this.servingsCount,
    required this.reviewCount,
  }) : uuid = const Uuid().v4();

  factory Recipe.fromJson(Map<String, dynamic> parsedJson) {
    return Recipe(
      name: parsedJson['name'],
      imageUrl: parsedJson['imageUrl'],
      duration: parsedJson['duration'],
      servingsCount: parsedJson['servingsCount'],
      reviewCount: parsedJson['reviewCount'],
    );
  }

  @override
  String toString() => 'Recipe(Name:$name -- ImageUrl:$imageUrl -- Duration:$duration -- ServingsCount:$servingsCount '
      '-- ReviewCount:$reviewCount)';
}
