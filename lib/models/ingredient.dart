class Ingredient {
  final int id;
  final String name;
  final String quantity;
  final String icon;

  Ingredient({
    required this.id,
    required this.name,
    required this.quantity,
    required this.icon,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
      icon: json['icon'],
    );
  }
}