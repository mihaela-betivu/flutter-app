class Tab {
  final String name;
  bool active;

  Tab({
    required this.name,
    required this.active,
  });

  factory Tab.fromJson(Map<String, dynamic> json) {
    return Tab(
      name: json['name'],
      active: json['active'],
    );
  }
}