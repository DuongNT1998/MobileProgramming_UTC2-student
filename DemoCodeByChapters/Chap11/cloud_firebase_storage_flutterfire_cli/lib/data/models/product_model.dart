class Product {
  String? id;
  String name;
  String description;
  double price;
  String image;
  String categoryId;
  DateTime createdAt;
  DateTime updatedAt;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.categoryId,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'categoryId': categoryId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Product.fromMap(String id, Map<String, dynamic> map) {
    return Product(
      id: id,
      name: map['name'],
      description: map['description'],
      price: map['price'] * 1.0,
      image: map['image'],
      categoryId: map['categoryId'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }
}
