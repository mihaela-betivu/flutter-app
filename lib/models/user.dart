class User {
  final String name;
  final String profileImage;
  final String greeting;

  User({
    required this.name,
    required this.profileImage,
    required this.greeting,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      profileImage: json['profile_image'],
      greeting: json['greeting'],
    );
  }
}