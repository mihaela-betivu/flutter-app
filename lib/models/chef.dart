class Chef {
  final String name;
  final String profileImage;
  final String location;
  bool isFollowing;

  Chef({
    required this.name,
    required this.profileImage,
    required this.location,
    required this.isFollowing,
  });

  factory Chef.fromJson(Map<String, dynamic> json) {
    return Chef(
      name: json['name'],
      profileImage: json['profile_image'],
      location: json['location'],
      isFollowing: json['is_following'],
    );
  }
}