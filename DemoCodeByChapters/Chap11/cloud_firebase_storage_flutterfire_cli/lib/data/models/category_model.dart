class Category {
  String? id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  Category({
    this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Category.fromMap(String id, Map<String, dynamic> map) {
    return Category(
      id: id,
      name: map['name'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }
}
