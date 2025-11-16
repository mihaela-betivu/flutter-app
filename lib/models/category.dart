class Category {
  final int id;
  final String name;
  final bool selected;

  Category({
    required this.id,
    required this.name,
    required this.selected,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      selected: json['selected'],
    );
  }
}