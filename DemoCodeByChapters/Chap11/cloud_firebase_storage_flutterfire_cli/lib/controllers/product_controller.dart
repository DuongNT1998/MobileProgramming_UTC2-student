import '../data/models/product_model.dart';
import '../data/repositories/product_repository.dart';

class ProductController {
  final repo = ProductRepository();

  Future<void> addProduct({
    required String name,
    required String description,
    required double price,
    required String image,
    required String categoryId,
  }) async {
    final now = DateTime.now();

    final product = Product(
      name: name,
      description: description,
      price: price,
      image: image,
      categoryId: categoryId,
      createdAt: now,
      updatedAt: now,
    );

    await repo.create(product);
  }

  Future<List<Product>> getProducts() async {
    return await repo.getAll();
  }
}
