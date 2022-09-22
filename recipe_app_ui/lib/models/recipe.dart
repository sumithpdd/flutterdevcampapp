class Recipe {
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
  });

  factory Recipe.fromJson(Map<String, dynamic> parsedJson) {
    return Recipe(
      name: parsedJson['name'],
      imageUrl: parsedJson['imageUrl'],
      duration: parsedJson['duration'],
      servingsCount: parsedJson['servingsCount'],
      reviewCount: parsedJson['reviewCount'],
    );
  }
}
