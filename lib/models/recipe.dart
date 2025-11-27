class Recipe {
  final int id;
  final String name;
  final double rating;
  final String time;
  bool isBookmarked;
  final String image;
  final int categoryId;

  Recipe({
    required this.id,
    required this.name,
    required this.rating,
    required this.time,
    required this.isBookmarked,
    required this.image,
    required this.categoryId,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'],
      name: json['name'],
      rating: json['rating'].toDouble(),
      time: json['time'],
      isBookmarked: json['is_bookmarked'],
      image: json['image'],
      categoryId: json['categoryId'] ?? 1,
    );
  }
}