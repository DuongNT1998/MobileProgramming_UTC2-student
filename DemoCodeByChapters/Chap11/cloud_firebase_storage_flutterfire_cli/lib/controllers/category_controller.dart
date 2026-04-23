import '../data/models/category_model.dart';
import '../data/repositories/category_repository.dart';

class CategoryController {
  final repo = CategoryRepository();

  Future<void> addCategory(String name) async {
    final now = DateTime.now();

    final category = Category(name: name, createdAt: now, updatedAt: now);

    await repo.create(category);
  }

  Future<List<Category>> getCategories() async {
    return await repo.getAll();
  }
}
