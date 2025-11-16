class NewRecipe {
  final int id;
  final String name;
  final double rating;
  final String author;
  final String time;
  final String image;
  final String authorImage;

  NewRecipe({
    required this.id,
    required this.name,
    required this.rating,
    required this.author,
    required this.time,
    required this.image,
    required this.authorImage,
  });

  factory NewRecipe.fromJson(Map<String, dynamic> json) {
    return NewRecipe(
      id: json['id'],
      name: json['name'],
      rating: json['rating'].toDouble(),
      author: json['author'],
      time: json['time'],
      image: json['image'],
      authorImage: json['author_image'],
    );
  }
}